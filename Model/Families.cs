using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class Families
    {
        private int detailId;
        private string name;
        private int relationship;
        private string occupation;
        private string phoneNumber;
        private string address;
        private string parentId;
        public int DetailId
        {
            get
            {
                return detailId;
            }

            set
            {
                detailId = value;
            }
        }

        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
            }
        }

        public int Relationship
        {
            get
            {
                return relationship;
            }

            set
            {
                relationship = value;
            }
        }

        public string Occupation
        {
            get
            {
                return occupation;
            }

            set
            {
                occupation = value;
            }
        }

        public string PhoneNumber
        {
            get
            {
                return phoneNumber;
            }

            set
            {
                phoneNumber = value;
            }
        }

        public string Address
        {
            get
            {
                return address;
            }

            set
            {
                address = value;
            }
        }

        public string ParentId
        {
            get
            {
                return parentId;
            }

            set
            {
                parentId = value;
            }
        }
    }
}
