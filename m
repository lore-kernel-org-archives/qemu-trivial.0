Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCt01-00031G-LF
	for mharc-qemu-trivial@gnu.org; Wed, 28 Mar 2012 09:33:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCszv-0002zA-6S
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:33:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCszo-0001dz-TI
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:33:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCszo-0001dZ-LA
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:33:04 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2SDX0A2031759
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 28 Mar 2012 09:33:01 -0400
Received: from garlic.tlv.redhat.com (spice-ovirt.tlv.redhat.com [10.35.4.71])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id q2SDWvHd009305; Wed, 28 Mar 2012 09:32:59 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 28 Mar 2012 15:32:57 +0200
Message-Id: <1332941577-24820-2-git-send-email-alevy@redhat.com>
In-Reply-To: <1332941577-24820-1-git-send-email-alevy@redhat.com>
References: <20120328131634.GY32389@garlic>
	<1332941577-24820-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: =?UTF-8?q?Llu=C3=ADs=20Vilanova?= <vilanova@ac.upc.edu>
Subject: [Qemu-trivial] [PATCH 2/2] tracetool: dtrace: warn on reserved word
	usage
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
X-List-Received-Date: Wed, 28 Mar 2012 13:33:17 -0000

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 scripts/tracetool |    1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/tracetool b/scripts/tracetool
index e7cebf3..d011bb7 100755
--- a/scripts/tracetool
+++ b/scripts/tracetool
@@ -496,6 +496,7 @@ EOF
     do
         # 'limit', 'in' and 'next' are reserved keywords
         if [ "$arg" = "limit" -o "$arg" = "in" -o "$arg" = "next" ]; then
+          echo "reserved word used in line: $1" 1>&2
           arg="_$arg"
         fi
         cat <<EOF
-- 
1.7.9.3


