Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ve0ad-0001fH-Qv
	for mharc-qemu-trivial@gnu.org; Wed, 06 Nov 2013 05:43:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Ve0aX-0001Vn-Kg
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 05:43:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Ve0aS-0002pJ-UE
	for qemu-trivial@nongnu.org; Wed, 06 Nov 2013 05:43:53 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:60615 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Ve0aJ-0002my-9D; Wed, 06 Nov 2013 05:43:39 -0500
Received: from localhost ([127.0.0.1] helo=sloy.cambridgebroadband.com)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Ve0cL-0001GD-1L; Wed, 06 Nov 2013 11:45:45 +0100
From: alex.bennee@linaro.org
To: qemu-devel@nongnu.org
Date: Wed,  6 Nov 2013 10:43:36 +0000
Message-Id: <1383734617-10516-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 1.8.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v6] Add .travis.yml metadata for CI
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
X-List-Received-Date: Wed, 06 Nov 2013 10:43:58 -0000

From: Alex Bennée <alex@bennee.com>

Hi,

I think this patch is ready to be merged via trivial. While I was
testing it last night it caught yet another regression
(register_subpage: Assertion, since fixed) so I think it proves it's
worth with that alone.

Since v5
      - Forced the python to 2.4 (our current baseline python)

Alex Bennée (1):
  .travis.yml: basic compile and check recipes

 .travis.yml | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 .travis.yml

-- 
1.8.4.2


