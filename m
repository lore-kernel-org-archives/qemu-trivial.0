Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bEvs4-0003rK-SA
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jun 2016 05:51:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bEvs2-0003pP-Bp
	for qemu-trivial@nongnu.org; Mon, 20 Jun 2016 05:51:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bEvs0-0004HY-HR
	for qemu-trivial@nongnu.org; Mon, 20 Jun 2016 05:51:53 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:62695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1bEvrw-0004Gl-0X; Mon, 20 Jun 2016 05:51:48 -0400
Received: from Quad.localdomain ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104) with ESMTPSA (Nemesis) id 0MFsVa-1b8pSQ1ET0-00EuR8;
	Mon, 20 Jun 2016 11:51:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Date: Mon, 20 Jun 2016 11:51:32 +0200
Message-Id: <1466416292-9615-1-git-send-email-laurent@vivier.eu>
X-Mailer: git-send-email 2.5.5
X-Provags-ID: V03:K0:kLB0fInjeJ7tzVogDQME4C5acxov5thXSPltenWEJOz8rx3EY2g
	MLITb0FQpKX0ByxsLM+/a2dXM8pvg50Mh0fe1stbTGqOHWJXS5+tmR7JVCo0Cfnhc3qUWeF
	+2qkdEvxICiy4b2ff9C2wVG38KoMFuiNmdvApKsVJ5K9afBP31h6RJ25+EWwSzyfmmp7wn6
	XUFbQqCOf1Lw2Yl9vxdCQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:HLEJrR5Dce8=:QIPeBl4qZ/zUcFjPpN84Lr
	viwzxwRQj5wtitNd0EzkHcUz+150cKM32ligioL6YHDvJDyGVCr+BuvXI2wyTj2/z65cAxi7X
	PsNH+yTh+qo6VrlzpitfTlZmy4T+tpiYWTftD+kdUDLhjhoFPuUjiiD1gA8ZnGtP9cYIrBkTh
	q68Q0hKiWJ17dCVjkAI0DmmGKKrsnnI5HbKz6ujr3jpTSwsycuIqmQ40r1Heyr6z9odTxD+NR
	g4leENtbHa2ciZlTL1kaPIrPe/AqbKBG8Sg2H9KrAjoAH9admT446HAnYeIiPM3ihx/a29dsx
	oVj9h+hOdCYlFDjmCeNTW+ujA9lP653TMu86AW+iafRBg8bLVykoiSyk9bWSxEesg/8YhgkaA
	IttmXTx2fbYAb4TRxktNfo6keCPyuNFmPvs6UyPRnF1cyB19AS84wancYJPkeOqb49U8jN+EE
	F9E7W0oZOM3J9Igw/939wdqZxkVu4zbGRK20PTwbiG4UzRbv4OvjHcD2Nt4Q3tWwyygi274Lm
	NNK8O7RDKVPqz1RAvQwIajWiEUYs7K/XoNe8mfXMZ9zPWSoUVyAvrVEgIv58otyqXgsPYVne2
	XOLP1ZWysAiMCQehRk8iXp38VehMF9wDZUTb0GNNwgjQnw/Tqz1G+bf4kaACj3xmV89pVEaGA
	GBC/4StJLmcmunw0tBv5URSRS+Q+8G0XuELX5xY2Qpm5h2GEMLWHpNnNbUxND6enW2wE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PATCH] linux-user,
 trivial: display "0x%x" instead of "0x%d"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jun 2016 09:51:55 -0000

Display an exception number, generally defined as an hexadecimal
number (for instance, EXCP_HLT is 0x10001).

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
Resent to fix qemu-trivial email address.

 linux-user/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index b9a4e0e..c79f5cb 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -2036,7 +2036,7 @@ void cpu_loop(CPUPPCState *env)
             /* just indicate that signals should be handled asap */
             break;
         default:
-            cpu_abort(cs, "Unknown exception 0x%d. Aborting\n", trapnr);
+            cpu_abort(cs, "Unknown exception 0x%x. Aborting\n", trapnr);
             break;
         }
         process_pending_signals(env);
-- 
2.5.5


