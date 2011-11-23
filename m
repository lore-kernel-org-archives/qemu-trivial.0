Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTGb8-0004Va-Rp
	for mharc-qemu-trivial@gnu.org; Wed, 23 Nov 2011 12:27:02 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RTGb3-00049p-5Y
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 12:26:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RTGb2-0008VR-5v
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 12:26:57 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:46820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RTGaz-0008UI-Iz; Wed, 23 Nov 2011 12:26:53 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RTGaq-0000Tr-Q6; Wed, 23 Nov 2011 17:26:44 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 23 Nov 2011 17:26:42 +0000
Message-Id: <1322069204-1824-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 0/2] configure: minor improvements to
	config.log
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
X-List-Received-Date: Wed, 23 Nov 2011 17:26:58 -0000

Two trivial patches which make it a little easier to look at config.log
and figure out what's going on.

The next step down this road would probably be something like
   test_start() {
       echo "# Checking for $1..." >> config.log
   }

and then lots of:
   test_start "zlib"
in the relevant places.
 


Peter Maydell (2):
  configure: Include #define name in check_define compiler error
  configure: Print a banner comment at the top of config.log

 configure |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)


