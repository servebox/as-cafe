package org.servebox.cafe.core.util
{
	/**
	 * StringHash is an ActionScript version of the "General Purpose Hash Function Algorithms Library" by Arash Partow.
	 * 
	 */
	public class StringHash
	{
		
		/**
		 * RS Hash algorithm.
		 * A simple hash function from Robert Sedgwicks Algorithms in C book.
		 * Partow added some simple optimizations to the algorithm in order to speed up its hashing process.
		 */
		public static function RSHash( str: String ):int
		{
			var b : int = 378551;
			var a : int = 63689;
			var hash : int = 0;
			
			for(var i : int = 0; i < str.length; i++)
			{
				hash = hash * a + str.charCodeAt(i);
				a    = a * b;
			}
			
			return ( hash & 0x7FFFFFFF );
		}
		/**
		 * JS Hash algorithm.
		 * A bitwise hash function written by Justin Sobel.
		 */
		public static function JSHash( str : String ) : int
		{
			var hash : int = 1315423911;
			
			for(var i : int = 0; i < str.length; i++)
			{
				hash ^= ( ( hash << 5 ) + str.charCodeAt( i ) + ( hash >> 2 ) );
			}
			
			return ( hash & 0x7FFFFFFF );
		}
		
		/**
		 * PJW Hash algorithm.
		 * This hash algorithm is based on work by Peter J. Weinberger of ATamp;T Bell Labs.
		 */
		public static function PJWHash( str : String ):int
		{
			var BitsInUnsignedInt : uint = ( 4 * 8 );
			var ThreeQuarters : uint = ( ( BitsInUnsignedInt  * 3 ) / 4 );
			var OneEighth : uint = ( BitsInUnsignedInt / 8 );
			var HighBits : int = ( 0xFFFFFFFF ) << ( BitsInUnsignedInt - OneEighth );
			var hash : int = 0;
			var test : int = 0;
			
			for( var i : int = 0; i < str.length; i++ )
			{
				hash = ( hash << OneEighth ) + str.charCodeAt( i );
				
				if( ( test = hash & HighBits )  != 0 )
				{
					hash = ( ( hash ^ ( test >> ThreeQuarters ) ) & ( ~HighBits ) );
				}
			}
			
			return ( hash & 0x7FFFFFFF );
		}
		
		/**
		 * ELF Hash algorithm.
		 * Similar to the PJW Hash function, but tweaked for 32-bit processors. Its the hash function widely used on most UNIX systems.
		 */
		public static function ELFHash( str : String ) : int
		{
			var hash : int = 0;
			var x : int = 0;
			
			for(var i : int = 0; i < str.length; i++)
			{
				hash = ( hash << 4 ) + str.charCodeAt( i );
				
				if( ( x = hash & 0xF0000000 ) != 0 )
				{
					hash ^= ( x >> 24 );
					hash &= ~x;
				}
			}
			
			return ( hash & 0x7FFFFFFF );
		}
		
		/**
		 * BKDR Hash algorithm.
		 * This hash function comes from Brian Kernighan and Dennis Ritchie's book "The C Programming Language".
		 * It is a simple hash function using a strange set of possible seeds which all constitute a pattern of 31....31...31 etc,
		 * it seems to be very similar to the DJB hash function.
		 */
		public static function BKDRHash( str : String ) : int
		{
			var seed : int = 131; // 31 131 1313 13131 131313 etc..
			var hash : int = 0;
			
			for(var i : int = 0; i < str.length; i++ )
			{
				hash = ( hash * seed ) + str.charCodeAt( i );
			}
			
			return ( hash & 0x7FFFFFFF );
		}
		
		/**
		 * SDB Hash algorithm.
		 * This is the algorithm of choice which is used in the open source SDBM project.
		 * The hash function seems to have a good over-all distribution for many different data sets.
		 * It seems to work well in situations where there is a high variance in the MSBs of the elements in a data set.
		 */
		public static function SDBMHash( str : String ) : int
		{
			var hash : int = 0;
			
			for(var i : int = 0; i < str.length; i++ )
			{
				hash = str.charCodeAt( i ) + ( hash << 6 ) + ( hash << 16 ) - hash;
			}
			
			return ( hash & 0x7FFFFFFF );
		}
		
		/**
		 * DJB Hash algorithm.
		 * An algorithm produced by Professor Daniel J. Bernstein and shown first to the world on the usenet newsgroup comp.lang.c.
		 * It is one of the most efficient hash functions ever published.
		 */
		public static function DJBHash( str : String ) : int
		{
			var hash : int = 5381;
			
			for( var i : int = 0; i < str.length; i++ )
			{
				hash = ( ( hash << 5 ) + hash ) + str.charCodeAt( i );
			}
			
			return ( hash & 0x7FFFFFFF );
		}
		
		/**
		 * DEK Hash algorithm.
		 *  An algorithm proposed by Donald E. Knuth in The Art Of Computer Programming Volume 3, under the topic of sorting and search chapter 6.4.
		 */
		public static function DEKHash( str : String ) : int
		{
			var hash : int = str.length;
			
			for( var i : int = 0; i < str.length; i++ )
			{
				hash = ( ( hash << 5 ) ^ ( hash >> 27 ) ) ^ str.charCodeAt( i );
			}
			
			return ( hash & 0x7FFFFFFF );
		}
		
		/**
		 * AP Hash algorithm.
		 * An algorithm produced by Arash Partow. taking ideas from all of the above hash functions,
		 * making a hybrid rotative and additive hash function algorithm based around four primes 3,5,7 and 11.
	
	public class StringHash
	{
		public function StringHash()
		{
		}
	}
}	 * There isn't any real mathematical analysis explaining why one should use this hash function instead of the others described above other than
		 * the fact that Partow tried to resemble the design as close as possible to a simple LFSR.
		 * An empirical result which demonstrated the distributive abilities of the hash algorithm was obtained using a hash-table with 100003 buckets,
		 * hashing The Project Gutenberg Etext of Webster's Unabridged Dictionary, the longest encountered chain length was 7,
		 * the average chain length was 2, the number of empty buckets was 4579.
		 */
		public static function APHash( str : String ) : int
		{
			var hash : int = 0;
			
			for( var i : int = 0; i < str.length; i++ )
			{
				if ( (i & 1) == 0 )
				{
					hash ^= ( ( hash << 7 ) ^ str.charCodeAt( i ) ^ ( hash >> 3 ) );
				}
				else
				{
					hash ^= ( ~( ( hash << 11 ) ^ str.charCodeAt( i ) ^ ( hash >> 5 ) ) );
				}
			}
			
			return ( hash & 0x7FFFFFFF );
		}
		
	}
}