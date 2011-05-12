package org.servebox.cafe.core.data
{
	public class ModelState
	{
		/**
		 * The model is currently fetching data.
		 */
		public static const FETCHING : int = 0;

		/**
		 * The data have been retrieved.
		 */
		public static const ACTIVE : int = 0;

		/**
		 * The model is in unconsistent state.
		 */
		public static const INVALID : int = 0;
	}
}