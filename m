Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS8l-0001dy-DU
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:24:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8f-0001ZG-D9
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8e-0002bF-DL
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:49 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:46009)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8T-0002ES-Me; Tue, 30 Oct 2018 07:24:39 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MpD7H-1fmRyA3pT5-00qjfJ; Tue, 30 Oct 2018 12:24:02 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MpD7H-1fmRyA3pT5-00qjfJ; Tue, 30 Oct 2018 12:24:02 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>
Date: Tue, 30 Oct 2018 12:23:25 +0100
Message-Id: <20181030112337.17973-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UtHzenpvkmoIR5/LsVJDipAqrOqtG3nw39d/ulzdI53DYC+EbVR
	KouSMMO2coulXWrvkiwIWNDCVSWIbpWqKAGbjpDtahupFSF0XNi2JYebztOqdt9nDb3upt7
	NvDA0LGYiF07gg245v58VXoGc9LosIDKVjZpzja4u04jgNpn3ek+XI7yJMfN1GmEUlMioTL
	+9DifyRj86RCe8rPRa83Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:elqk0PMnEUI=:CwXmlMJt2K2ka2J+PyU3K1
	aJ6IU0eo5eonT22ctfPJWh0D4U+pYX4lW0IlfYRM7IqKy+MQbH+gPQqjkqgMf7hjV7TY+xwm1
	ojZI9hgnUDBsCykPXQgjFz76hLb/eP6Z0WN028Pz+kSLyJerywwf/pW6dtBM2PbyiLwGFWucm
	IFXcahvX6LCik1X2oUu/g73S+K9iUgUNBihWQPMz0UsmsZjKf6tX2yUtwhZrRfpPK11vO9xAD
	yXB9KDOUg3U8WX0WgHunVkdLqpFvvLTextN62UiAXCr48NPAENjdq/zeZgXd6MifSHzgYqJGR
	HzlMGsREIlfSKucNhR3qPv0xzz+QM14UBccXxSylLnrBmnNagCeoBp53C9Qvr0MaeXXRwnlux
	IrSED7doIUyRLZLIr8rIe5SIofWKiGIZK2f9RyVzbkXPsTnwSPGU57stMQW9Tql9cmfdAoyw+
	kyENpWHNmo7OBW9UnC7lJfZ4tVorEQDbCu9wP/Ly9ZshYq4P5lIMBaaJviHfjRpN/stSHazSr
	EDR+7I7/4It5VnPIkOOE4iS4FGD/Uv9EvwZFLUHTn0cFRqeEUbc0lOCxmzL87uxd1mlobASPg
	vWaeBVficokM6WWBwbdT8YCBAjEBbPzHPHlLMU0nztfoRJWqradWwjs1mJrOvQR69JSmTuE1W
	pT5SqXHv8xnzrpWsaByE7VpzRFk97MUk830Ro9hO2hSnG74+IayWmwqw0pBZ6qWzolnb28TK/
	HuxU1/IDxG2n51qv
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL v2 08/20] scripts/qemu.py: remove trailing
 quotes on docstring
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
X-List-Received-Date: Tue, 30 Oct 2018 11:24:50 -0000

From: Cleber Rosa <crosa@redhat.com>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181004161852.11673-11-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qemu.py b/scripts/qemu.py
index f099ce7278..b0b2f12ce6 100644
--- a/scripts/qemu.py
+++ b/scripts/qemu.py
@@ -87,7 +87,7 @@ class QEMUMachine(object):
         @param name: prefix for socket and log file names (default: qemu-PID)
         @param test_dir: where to create socket and log file
         @param monitor_address: address for QMP monitor
-        @param socket_scm_helper: helper program, required for send_fd_scm()"
+        @param socket_scm_helper: helper program, required for send_fd_scm()
         @note: Qemu process is not started until launch() is used.
         '''
         if args is None:
-- 
2.17.2


