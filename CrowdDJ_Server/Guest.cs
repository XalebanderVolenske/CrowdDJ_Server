//------------------------------------------------------------------------------
// <auto-generated>
//     Der Code wurde von einer Vorlage generiert.
//
//     Manuelle Änderungen an dieser Datei führen möglicherweise zu unerwartetem Verhalten der Anwendung.
//     Manuelle Änderungen an dieser Datei werden überschrieben, wenn der Code neu generiert wird.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CrowdDJ_Server
{
    using System;
    using System.Collections.Generic;
    
    public partial class Guest
    {
        public int UserID { get; set; }
        public int Partycode { get; set; }
        public Nullable<int> PartyID { get; set; }
    
        public virtual Party Party { get; set; }
        public virtual User User { get; set; }
    }
}