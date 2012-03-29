Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SDN0X-0001RE-6Y
	for mharc-qemu-trivial@gnu.org; Thu, 29 Mar 2012 17:35:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:32919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SDN0U-0001Pw-0I
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 17:35:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SDN0S-0002v6-8M
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 17:35:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15859)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SDN0S-0002uq-03
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 17:35:44 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2TLZflC011670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 29 Mar 2012 17:35:41 -0400
Received: from garlic.redhat.com (vpn-201-133.tlv.redhat.com [10.35.201.133])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id q2TLZbXI025909; Thu, 29 Mar 2012 17:35:40 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 29 Mar 2012 23:35:37 +0200
Message-Id: <1333056937-14748-2-git-send-email-alevy@redhat.com>
In-Reply-To: <1333056937-14748-1-git-send-email-alevy@redhat.com>
References: <1332944776-4037-1-git-send-email-alevy@redhat.com>
	<1333056937-14748-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Thu, 29 Mar 2012 21:35:47 -0000

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 scripts/tracetool |    1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/tracetool b/scripts/tracetool
index ab788f2..c2aed8f 100755
--- a/scripts/tracetool
+++ b/scripts/tracetool
@@ -497,6 +497,7 @@ EOF
         # postfix reserved words with '_'
         case "$arg" in
             limit|in|next|self)
+                echo "reserved word used in line: $1" 1>&2
                 arg="${arg}_"
                 ;;
         esac
-- 
1.7.9.3


