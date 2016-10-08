Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsoRN-00014J-Ij
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 06:01:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bsoRK-00014A-48
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 06:01:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bsoRF-0008P6-Uf
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 06:01:09 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:50105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1bsoRF-0008OU-KY; Sat, 08 Oct 2016 06:01:05 -0400
Received: from Quad.localdomain ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104) with ESMTPSA (Nemesis) id 0M0iAY-1b1GmH3ZHy-00umvv;
	Sat, 08 Oct 2016 12:00:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>
Date: Sat,  8 Oct 2016 12:00:07 +0200
Message-Id: <1475920807-13485-1-git-send-email-laurent@vivier.eu>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K0:AHBczmO0HCZr/w6rhBDz32uAAjEUiSuILicxIPaxiIHTZ7HecX+
	AUYrJC5YXrEOJd4T515rMdvNd6CC7XSjRl/nq8L+ZszO3LPwl19a2DhSV5BJ/g5n95qdXI6
	BwhVvuBzMn4w1SANQRYalHva6OnQNBagSfNlBdxYTmlUcrIfy0NHjoVoFdAH3fs3B1WAHKj
	/NefYjlX8pmdVDzu6XV3g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:y1Oa1dU1foc=:TZZoqQR8je0671viIZzD/U
	mqQDJlX47uFiymAJfJXXzDfzDJCcWnZFMYnqdabGNDdVLfXzJTMsG84kf0r/7wd5mXtI+aKQw
	knK30dFJvSjizXsv1NGsDB1gRGBaWav9VHAkIk3oSNER8ax2qYJT/PVdEe2N6zyqnYRlLDZ1/
	3IsUDxinMZ09pk/NN7gxCQeWdB9slZAuXv+M2sveDPbipQkMkGK5C3XNqtfPsY7wLmZDxguCe
	8TTYCkg7YFOhavQAwu2lJm9NzGf+8knvGUSl60s1xXimgv/7HrssNcupHud1chgltnHy58i8d
	eLOfbieA4FfK7Lo5b3hr4m59TDpVb2wgUXkab/b7FNRoV3BBTF47BWkvJOpMwhpiitqpruK83
	vNEZsD51XClP6fL8mxpysHfLfvabkLETn+iiOxVHKFFOf8KSlP2ix4AFyUlhUdHRQgClZ5+Kq
	GAsxriyDMNSYTAutBeAV7I8QwlLtxlV3+xXiPLtDK/zjNNWb9F2Oyj2DPCLi3auo4c/MLBP/0
	0VD4p1UzMenYWLanqidnnt3EU6Q4ZaQu1kJrSplsd3H/BZ1xyWstBSknDdufDZj9WDxAFvCEp
	NSOirtTbTcXPN1zyX0iLGDpZtxucAFXZxH5q6pRIJQIwFqXNaMOB7xqvyk56PQeplsYoo0Xc3
	gJKSRwd6xFznqpqxvp09U1iL8JHr2lgJWHEWbg8TRjMKwKdzmcll6ojzxrCsgh3Df7jM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PATCH v2] MAINTAINERS: qemu-trivial information
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
X-List-Received-Date: Sat, 08 Oct 2016 10:01:11 -0000

Information about "qemu-trivial" ML can be found in the wiki:

    http://wiki.qemu.org/Contribute/TrivialPatches

But the first place where a developer looks is the file MAINTAINERS.

This also allows the get_maintainer.pl script to display
the qemu-trivial ML address when the mail subject contains "trivial".

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
v2:
- move to the top
- add my name to help Michael to manage trivial-patches

 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9bca506..18e38e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -63,6 +63,17 @@ W: http://wiki.qemu.org/SecurityProcess
 M: Michael S. Tsirkin <mst@redhat.com>
 L: secalert@redhat.com
 
+Trivial patches
+---------------
+Trivial patches
+M: Michael Tokarev <mjt@tls.msk.ru>
+M: Laurent Vivier <laurent@vivier.eu>
+S: Maintained
+L: qemu-trivial@nongnu.org
+K: ^Subject:.*(?i)trivial
+T: git git://git.corpit.ru/qemu.git trivial-patches
+T: git git://github.com/vivier/qemu.git trivial-patches
+
 Guest CPU cores (TCG):
 ----------------------
 Overall
-- 
2.7.4


