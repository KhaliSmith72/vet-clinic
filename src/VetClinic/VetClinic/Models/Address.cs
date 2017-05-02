using VetClinic.Interfaces;

namespace VetClinic.Models
{
    class Address : IEntity
    {
        public int Id { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }

        public override string ToString()
        {
            return $"Id: {Id}, Street: {Street}, City: {City}, State: {State}, Zip: {Zip}";
        }
    }
}
