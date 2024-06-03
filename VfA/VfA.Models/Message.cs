using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
	public class Message
	{
		[Key]
		public int MessageId { get; set; }

		[Required]
		public int SenderUserId { get; set; }

		[Required]
		public int ReceiverUserId { get; set; }

		[Required]
		[MaxLength(500)] // Ajustez la longueur maximale selon vos besoins
		public string Content { get; set; }

		[Required]
		public DateTime Timestamp { get; set; }

		public bool IsRead { get; set; }

		public string AttachmentUrl { get; set; } // URL du fichier ou de l'image attaché

		// Autres propriétés de notification si nécessaire

		[ForeignKey("SenderUserId")]
		[InverseProperty("SentMessages")]
		public virtual User Sender { get; set; }

		[ForeignKey("ReceiverUserId")]
		[InverseProperty("ReceivedMessages")]
		public virtual User Receiver { get; set; }
	}

	// Classe utilisateur pour référence
	public class User
	{
		[Key]
		public int UserId { get; set; }

		[Required]
		[MaxLength(100)] // Ajustez la longueur maximale selon vos besoins
		public string Username { get; set; }

		// Autres propriétés utilisateur

		// Messages envoyés par cet utilisateur
		[InverseProperty("Sender")]
		public virtual ICollection<Message> SentMessages { get; set; }

		// Messages reçus par cet utilisateur
		[InverseProperty("Receiver")]
		public virtual ICollection<Message> ReceivedMessages { get; set; }
	}
}
