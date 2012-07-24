Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Stfp5-0005R3-Rn
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jul 2012 10:10:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Stfoz-00057K-MS
	for qemu-trivial@nongnu.org; Tue, 24 Jul 2012 10:10:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Stfov-0004GC-27
	for qemu-trivial@nongnu.org; Tue, 24 Jul 2012 10:10:45 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:50777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Stfok-0003xr-FK; Tue, 24 Jul 2012 10:10:30 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Stfoh-0006A2-Fq; Tue, 24 Jul 2012 15:10:27 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jul 2012 15:10:27 +0100
Message-Id: <1343139027-23659-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	Alexander Graf <agraf@suse.de>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/escc: Drop duplicate definition of
	'disabled' property
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
X-List-Received-Date: Tue, 24 Jul 2012 14:10:50 -0000

Drop a duplicate definition of the 'disabled' property from
the escc qdev property list: this redefinition is currently
effectively ignored but will become an error. (The duplication
was inadvertently introduced in 2009 in commit ec02f7dec2.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Other than the armv7m_nvic, this is the only other case of an
attempt to set a duplicate property that I could find in my
"start every machine QEMU implements" test...

 hw/escc.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/hw/escc.c b/hw/escc.c
index 4d8a8e8..e1f5e73 100644
--- a/hw/escc.c
+++ b/hw/escc.c
@@ -905,7 +905,6 @@ static Property escc_properties[] = {
     DEFINE_PROP_UINT32("frequency", SerialState, frequency,   0),
     DEFINE_PROP_UINT32("it_shift",  SerialState, it_shift,    0),
     DEFINE_PROP_UINT32("disabled",  SerialState, disabled,    0),
-    DEFINE_PROP_UINT32("disabled",  SerialState, disabled,    0),
     DEFINE_PROP_UINT32("chnBtype",  SerialState, chn[0].type, 0),
     DEFINE_PROP_UINT32("chnAtype",  SerialState, chn[1].type, 0),
     DEFINE_PROP_CHR("chrB", SerialState, chn[0].chr),
-- 
1.7.5.4


