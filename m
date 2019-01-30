Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goppf-0001Kp-5K
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppb-0001JU-Q1
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppX-0006GV-Tz
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:05 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:33997)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goppU-0006Dq-Ra; Wed, 30 Jan 2019 08:23:02 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MYeV1-1gbxnn2CUF-00Vez8; Wed, 30 Jan 2019 14:22:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Igor Mammedov <imammedo@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Stefan Hajnoczi <stefanha@redhat.com>,
	Stafford Horne <shorne@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	kumar sourav <sourav.jb1988@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Date: Wed, 30 Jan 2019 14:22:05 +0100
Message-Id: <20190130132214.25493-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZCwKEsftnvthvnt9pUKyjZYKqeBKnPcBO3qkmPQixLvyehxKPeY
	nFFIi+154JNyCbmxjzsDVwQUm06hq1xn02H9CnGind/zCgjlQ3v9VhGQ9kBYmFa1xW8CnYB
	Om/zbbw+aw8PaKy8vRwklA98WsAmtLtvNdA54Jp4heH+HjvfLuIEeCZw8T5VwxVo7h3JqtW
	+48MGkecdg2sJYpVVVoKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cj8bpYygEI8=:UNwKdsqRc8ImkMkk6h24QF
	1DfO8tgzOutaKICr0ouRau2PSCl36daJnbo/hbAZ4KWA5FWcF+ogemcFgrWxauYYaQRjCy59a
	2Xy4lZxNtCYajkR7kp21h/Qq1ihRHvEVrrcwTsyMDl6ERRjIQAb0qVo8Av2e6gFRkteqXTqJK
	7aVuCkTiuS37F7p7Yv/XozLnhQuZLcxV0nkUvDl/d5/cxL+wljdesANqBYEdrxhkgovC0svJK
	KxEQ7cTEVaVpMdxbOGKljSx8qem9ZG5TwM6O5EBibLxLR61ifi5eIaaemn8fY7pvtGoaexYON
	+1DYFyj7pDhW+TfwbmbhuOUj/km9R9IkzNRXqi/lInw4P3NXNyDl5CNqM5il5teNt2W+SC77J
	I2xyBKWnXIcuqT+yvmYcxxEOe8zrsbbqzJD23zqc7MZnolpC4CRac2mPrlqn/PC0PUrxmxJ6y
	TagMD2RILvfLPNAbG4QaGkePNLtdc428VYWLqKxX/lqiZhYWU3oeGVpCKySA4pPd+DoXTQNb5
	+iTUUFROdjyh4coPIqjGtzj3h1IuqwSTRJOSESRqEezjB7R52bzGxxKokg169GAS9dngIgX5S
	DQVxoZcAYDw/DaRvhqzTzLsNfLfhSVU8wfG6nSRHqs22Mm7nQdG1AcZAFLZRurg5n+9Eo5kTC
	wY+j24G84/SY4VXW/x0V7C/eRBpgdaFxFBMD+YJJ31Nqv8+uU/roC6Ze7ZQHeaX0E9oQ5nYRa
	t4lhqA5TIQK3XTgGVPPsmOx0fR8bPmaImPOmoMpHAF2MtQyFFG+HLa08AwU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 04/13] hw: sd: set category of the sd memory
 card
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:10 -0000

From: kumar sourav <sourav.jb1988@gmail.com>

Sets the category of the sd memory card as DEVICE_CATEGORY_STORAGE.
Devices should be assigned to one of DEVICE_CATEGORY_XXXX.

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190124162045.10474-1-sourav.jb1988@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/sd/sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d4356e9b73..aaab15f386 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2121,6 +2121,7 @@ static void sd_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &sd_vmstate;
     dc->reset = sd_reset;
     dc->bus_type = TYPE_SD_BUS;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 
     sc->set_voltage = sd_set_voltage;
     sc->get_dat_lines = sd_get_dat_lines;
-- 
2.20.1


