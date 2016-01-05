Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aGM7k-0007xa-UI
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jan 2016 02:33:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sits@sucs.org>) id 1aGM7j-0007vm-19
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:33:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sits@sucs.org>) id 1aGM7i-0007fj-Bh
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:33:42 -0500
Received: from silver.sucs.swan.ac.uk ([137.44.10.1]:56285)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sits@sucs.org>)
	id 1aGM7g-0007cC-Bk; Tue, 05 Jan 2016 02:33:40 -0500
Received: from sits by silver.sucs.swan.ac.uk with local (Exim 4.80)
	(envelope-from <sits@sucs.org>)
	id 1aGM7Y-0006eh-HK; Tue, 05 Jan 2016 07:33:32 +0000
From: Sitsofe Wheeler <sitsofe@yahoo.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Jan 2016 07:33:29 +0000
Message-Id: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 137.44.10.1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 0/3] qemu-nbd.texi formatting,
	grammar and completeness fixes
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
X-List-Received-Date: Tue, 05 Jan 2016 07:33:43 -0000

Bring the qemu-nbd man page up to date with options and fix some styling and
grammar issues along the way.

Changes from v1:
- Add disconnect usage to synopsis.
- Add styling to synopsis usage.
- Fix up the grammar in the description.
- Move filename variable description out of the option table.
- Add a description of the NBD dev variable.
- Add reference to qemu man page to see also section.
- Fix sentence capitalisation in options section.

Sitsofe Wheeler (3):
  qemu-nbd: Fix unintended texi verbatim formatting
  qemu-nbd: Minor texi updates
  qemu-nbd: Fix texi sentence capitalisation

 qemu-nbd.texi | 80 +++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 45 insertions(+), 35 deletions(-)

-- 
2.4.3


