Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XK1mn-0005o5-Gq
	for mharc-qemu-trivial@gnu.org; Wed, 20 Aug 2014 05:02:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1XK1ml-0005kx-4T
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 05:02:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1XK1mj-00008U-MI
	for qemu-trivial@nongnu.org; Wed, 20 Aug 2014 05:02:27 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:48133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1XK1mY-0008T2-Jb; Wed, 20 Aug 2014 05:02:14 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id F1D3417F6E5; Wed, 20 Aug 2014 11:02:10 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed, 20 Aug 2014 11:02:10 +0200
Message-Id: <1408525330-25414-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] libdecnumber: Fix warnings from smatch
	(missing static, boolean operations)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Aug 2014 09:02:28 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 libdecnumber/decNumber.c |   21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/libdecnumber/decNumber.c b/libdecnumber/decNumber.c
index a30632f..58211e7 100644
--- a/libdecnumber/decNumber.c
+++ b/libdecnumber/decNumber.c
@@ -5275,8 +5275,8 @@ static decNumber * decMultiplyOp(decNumber *res, const decNumber *lhs,
 /* 4. The working precisions for the static buffers are twice the     */
 /*    obvious size to allow for calls from decNumberPower.	      */
 /* ------------------------------------------------------------------ */
-decNumber * decExpOp(decNumber *res, const decNumber *rhs,
-			 decContext *set, uInt *status) {
+static decNumber *decExpOp(decNumber *res, const decNumber *rhs,
+                           decContext *set, uInt *status) {
   uInt ignore=0;		   /* working status */
   Int h;			   /* adjusted exponent for 0.xxxx */
   Int p;			   /* working precision */
@@ -5563,7 +5563,8 @@ decNumber * decExpOp(decNumber *res, const decNumber *rhs,
 /*	     where x is truncated (NB) into the range 10 through 99,  */
 /*	     and then c = k>>2 and e = k&3.			      */
 /* ------------------------------------------------------------------ */
-const uShort LNnn[90]={9016,  8652,  8316,  8008,  7724,  7456,	 7208,
+static const uShort LNnn[90] = {
+  9016,  8652,  8316,  8008,  7724,  7456,  7208,
   6972,	 6748,	6540,  6340,  6148,  5968,  5792,  5628,  5464,	 5312,
   5164,	 5020,	4884,  4748,  4620,  4496,  4376,  4256,  4144,	 4032,
  39233, 38181, 37157, 36157, 35181, 34229, 33297, 32389, 31501, 30629,
@@ -5635,8 +5636,8 @@ const uShort LNnn[90]={9016,  8652,  8316,  8008,  7724,  7456,	 7208,
 /* 5. The static buffers are larger than might be expected to allow   */
 /*    for calls from decNumberPower.				      */
 /* ------------------------------------------------------------------ */
-decNumber * decLnOp(decNumber *res, const decNumber *rhs,
-		    decContext *set, uInt *status) {
+static decNumber *decLnOp(decNumber *res, const decNumber *rhs,
+                          decContext *set, uInt *status) {
   uInt ignore=0;		   /* working status accumulator */
   uInt needbytes;		   /* for space calculations */
   Int residue;			   /* rounding residue */
@@ -6052,9 +6053,9 @@ static decNumber * decQuantizeOp(decNumber *res, const decNumber *lhs,
 /* The emphasis here is on speed for common cases, and avoiding	      */
 /* coefficient comparison if possible.				      */
 /* ------------------------------------------------------------------ */
-decNumber * decCompareOp(decNumber *res, const decNumber *lhs,
-			 const decNumber *rhs, decContext *set,
-			 Flag op, uInt *status) {
+static decNumber *decCompareOp(decNumber *res, const decNumber *lhs,
+                               const decNumber *rhs, decContext *set,
+                               Flag op, uInt *status) {
   #if DECSUBSET
   decNumber *alloclhs=NULL;	   /* non-NULL if rounded lhs allocated */
   decNumber *allocrhs=NULL;	   /* .., rhs */
@@ -6086,11 +6087,11 @@ decNumber * decCompareOp(decNumber *res, const decNumber *lhs,
 
     /* If total ordering then handle differing signs 'up front' */
     if (op==COMPTOTAL) {		/* total ordering */
-      if (decNumberIsNegative(lhs) & !decNumberIsNegative(rhs)) {
+      if (decNumberIsNegative(lhs) && !decNumberIsNegative(rhs)) {
 	result=-1;
 	break;
 	}
-      if (!decNumberIsNegative(lhs) & decNumberIsNegative(rhs)) {
+      if (!decNumberIsNegative(lhs) && decNumberIsNegative(rhs)) {
 	result=+1;
 	break;
 	}
-- 
1.7.10.4


