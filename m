Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VCu2b-000330-FS
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2013 12:16:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1VCu2W-0002uZ-J6
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1VCu2T-000518-Om
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 12:16:44 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:59444 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1VCu2N-0004xI-4b; Fri, 23 Aug 2013 12:16:35 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1VCu2L-0002IM-HN; Fri, 23 Aug 2013 17:16:33 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2013 17:16:31 +0100
Message-Id: <1377274593-8797-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH 0/2] lsi53c895a: avoid integer undefined
	behaviours
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
X-List-Received-Date: Fri, 23 Aug 2013 16:16:47 -0000

More patches to fix clang sanitizer warnings; in this case we
can fix them and clean up the code a bit by replacing hand-coded
operations with functions from the bitops header.

Peter Maydell (2):
  hw/scsi/lsi53c895a: Use sextract32 for sign-extension
  hw/scsi/lsi53c895a: Use deposit32 rather than handcoded shift/mask

 hw/scsi/lsi53c895a.c |   19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

-- 
1.7.9.5


