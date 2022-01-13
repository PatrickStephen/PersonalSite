using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVC2EFSecured.DATA.EF//.Metadata
                               /*General rules and standard practices for metadata:
                            * 1) All metadata can exist in a single file for all classes associated to EF ***
                            * 2) Metadata can be split between files (1 file for metadata and application) for each class
                            *    associated to EF. (we are doing number1, this is the alternative method)
                            * 3) Metadata classes MUST live in the same namespace as the original EF class.
                            * 4) Short process for each pair of metadata class and EF class and connecting the 2.
                            *      a)Ensure that the namespaces for files match (match the .tt namespace)
                            *      b)Create the metadata class (empty)
                            *      c)Create the partial class with the same EXACT name as the EF class
                            *      d)Apply the Metadata class to the partial class
                            *      e)Use the EF class to copy in the properties for the metadata class
                            *      f)Apply all necessary metadata attributes
                            * 5) Use the ER diagram from SSMS to ensure that all validation is correct.
                            */
{
    #region Author Metadata

    public class AuthorMetadata
    {

        //public int AuthorID { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "First Name")]
        [StringLength(15, ErrorMessage = "* Value must be 15 characters or less.")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Last Name")]
        [StringLength(15, ErrorMessage = "* Value must be 15 characters or less.")]
        public string LastName { get; set; }

        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string City { get; set; }

        [StringLength(2, ErrorMessage = "* Value must be 2 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string State { get; set; }

        [StringLength(6, ErrorMessage = "* Value must be 6 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Zip Code")]
        public string ZipCode { get; set; }

        [StringLength(30, ErrorMessage = "* Value must be 30 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Country { get; set; }

    }

    [MetadataType(typeof(AuthorMetadata))]
    public partial class Author
    {
        //Custom props - definded in the BUDDY (partial) class with the same name as the Model
        [Display(Name = "Full Name")]
        public string FullName
        {
            get { return $"{FirstName} {LastName}"; }
        }
    }
    #endregion



    #region Book Metadata
    public class BookMetadata
    {
        //public int BookID { get; set; }
        [StringLength(14, ErrorMessage = "* The value must be 14 characters.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string ISBN { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(100, ErrorMessage = "* The value must be 100 characters or less")]
        [Display(Name = "Book")]
        [UIHint("MultilineText")]
        public string BookTitle { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }

        //This is a foreign key (FK) to the Genres Table. If it were REQUIRED, we would keep it and provide
        //our own custom field messaging to override the default messaging from EF.
        //public Nullable<int> GenreID { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "* Value must be a valid number, 0 or larger.")]
        [DisplayFormat(DataFormatString = "{0:c}", NullDisplayText = "[-N/A-]")]
        public decimal? Price { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "* Value must be a valid number greater than 0")]
        [Display(Name = "Units Sold")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public int? UnitsSold { get; set; }

        [Display(Name = "Published")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true, NullDisplayText = "[-N/A-]")]
        //[DataType(DataType.Date)] - Populates the UI with an HTML 5 input type="Date" 
        //This doesn't work well with edits. We will add a jQueryUI DatePicker later 
        //to ensure a valid date is provided.
        public DateTime? PublishDate { get; set; }

        //This is a REQUIRED FK value - we want to override the default messaging provided by
        //EF
        [Required(ErrorMessage = "*")]
        public int PublisherID { get; set; }

        [Display(Name = "Image")]
        //all validation, etc will be done when we MANUALLY process the image in the controller.
        public string BookImage { get; set; }

        [Display(Name = "Site Feature")]
        public bool IsSiteFeature { get; set; }

        [Display(Name = "Genre Feature")]
        public bool IsGenreFeature { get; set; }

        //non-nullable FK
        [Required(ErrorMessage = "*")]//-FK
        //[Display(Name="")] are cared for in the class that represents the lookup table.        
        public int BookStatusID { get; set; }
    }

    [MetadataType(typeof(BookMetadata))]
    public partial class Book { }
    #endregion



    //#region BookStatus Metadata
    //public class BookStatusMetadata
    //{
    //    //public int BookStatusID { get; set; }

    //    [Display(Name = "Status")]
    //    [Required(ErrorMessage = "*")]
    //    [StringLength(25, ErrorMessage = "* The value must be 25 characters or less")]
    //    public string BookStatusName { get; set; }

    //    [Required(ErrorMessage = "*")]
    //    [StringLength(100, ErrorMessage = "* The value must be 100 characters or less")]
    //    public string Notes { get; set; }
    //}
    //[MetadataType(typeof(BookStatusMetadata))]
    //public partial class BookStatus { }
    //#endregion



    //#region Publisher Metadata
    //public class PublisherMetadata
    //{
    //    //public int PublisherID { get; set; }
    //    [Display(Name = "Publisher")]
    //    [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
    //    [DisplayFormat(NullDisplayText = "[-N/A-]")]
    //    public string PublisherName { get; set; }

    //    [StringLength(20, ErrorMessage = "* Value must be 20 characters or less.")]
    //    [DisplayFormat(NullDisplayText = "[-N/A-]")]
    //    public string City { get; set; }

    //    [StringLength(2, ErrorMessage = "* Value must be 2 characters or less.")]
    //    [DisplayFormat(NullDisplayText = "[-N/A-]")]
    //    public string State { get; set; }


    //    public bool IsActive { get; set; }
    //}
    //[MetadataType(typeof(PublisherMetadata))]
    //public partial class Publisher { }
    //#endregion



    //#region Genre Metadata
    //public class GenreMetadata
    //{
    //    //public int GenreID { get; set; }

    //    [Display(Name = "Genre")]
    //    [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
    //    [DisplayFormat(NullDisplayText = "[-N/A-]")]
    //    public string GenreName { get; set; }
    //}
    //[MetadataType(typeof(GenreMetadata))]
    //public partial class Genre { }
    //#endregion



    //#region Magazine Metadata
    //public class MagazineMetadata
    //{
    //    //public int MagazineID { get; set; }
    //    [Display(Name = "Title")]
    //    [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
    //    [DisplayFormat(NullDisplayText = "[-N/A-]")]
    //    public string MagazineTitle { get; set; }

    //    [Range(0, double.MaxValue, ErrorMessage = "* Value must be a valid number greater than 0")]
    //    [Display(Name = "Units Sold")]
    //    [DisplayFormat(NullDisplayText = "[-N/A-]")]
    //    public int IssuesPerYear { get; set; }

    //    [Range(0, double.MaxValue, ErrorMessage = "* Value must be a valid number, 0 or larger.")]
    //    [DisplayFormat(DataFormatString = "{0:c}", NullDisplayText = "[-N/A-]")]
    //    public decimal PricePerYear { get; set; }


    //    [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
    //    [DisplayFormat(NullDisplayText = "[-N/A-]")]
    //    public string Category { get; set; }

    //    public Nullable<int> Circulation { get; set; }

    //    public string PublishRate { get; set; }
    //}
    //[MetadataType(typeof(MagazineMetadata))]
    //public partial class Magazine { }
    //#endregion




    #region Genre Metadata
    public class GenreMetadata
    {

        //public int GenreID { get; set; }

        [Display(Name = "Genre")]
        [Required(ErrorMessage = "*")]
        [StringLength(25, ErrorMessage = "* Value must be 25 characters or less.")]
        public string GenreName { get; set; }
    }

    [MetadataType(typeof(GenreMetadata))]
    public partial class Genre { }

    #endregion

    #region BookStatus Metadata
    public class BookStatusMetadata
    {
        //public int BookStatusID { get; set; }
        [Display(Name = "Status")]
        [Required(ErrorMessage = "*")]
        [StringLength(25, ErrorMessage = "* Value must be 25 characters or less.")]
        public string BookStatusName { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Notes { get; set; }
    }

    [MetadataType(typeof(BookStatusMetadata))]
    public partial class BookStatus { }

    #endregion

    #region Publisher Metadata
    public class PublisherMetadata
    {
        //public int PublisherID { get; set; }

        [Display(Name = "Publisher")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        [Required(ErrorMessage = "*")]
        public string PublisherName { get; set; }

        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string City { get; set; }

        [StringLength(2, ErrorMessage = "* Value must be 2 characters.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string State { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(PublisherMetadata))]
    public partial class Publisher { }


    #endregion

    #region Magazines Metdata
    public class MagazineMetadata
    {
        //public int MagazineID { get; set; }

        [Display(Name = "Magazine")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        [Required(ErrorMessage = "*")]
        public string MagazineTitle { get; set; }

        [Display(Name = "Issues/Year")]
        [Range(1, 104, ErrorMessage = "* Value must be between 1 and 104.")]
        [Required(ErrorMessage = "*")]
        public int IssuesPerYear { get; set; }

        [Display(Name = "Annual Price")]
        [DisplayFormat(DataFormatString = "{0:c}")]
        [Required(ErrorMessage = "*")]
        public decimal PricePerYear { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string Category { get; set; }

        [Range(0, int.MaxValue, ErrorMessage = "* Value must be a whole number, 0 or greater.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public int? Circulation { get; set; }

        [Display(Name = "Publish Rate")]
        [StringLength(20, ErrorMessage = "* Value must be 20 characters or less.")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string PublishRate { get; set; }
    }
    [MetadataType(typeof(MagazineMetadata))]
    public partial class Magazine { }

    #endregion

}

