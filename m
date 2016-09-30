Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpuAv-0005f6-OE
	for mharc-qemu-trivial@gnu.org; Fri, 30 Sep 2016 05:32:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1bpuAt-0005eh-4l
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 05:32:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1bpuAo-0000ii-6X
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 05:32:11 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34581)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>)
	id 1bpuAo-0000iJ-14; Fri, 30 Sep 2016 05:32:06 -0400
Received: by mail-wm0-f66.google.com with SMTP id p197so1085521wmg.1;
	Fri, 30 Sep 2016 02:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=K9DwDA3SVWR03F7KCVcOI3s1RbwwZBpUWj/mGhthRtw=;
	b=BqS26XfzyE5JSWLtVnWXQcMBzj97QY+ibbKy0dti0IcMqW+lJCOqUjM6P8ueygpFm0
	PXorJSs2HKEhkyZCaLyN0Ici+15LFO+85hHpbsCWeBedMuu7p9KLnQnHQssyS1qgxM6Z
	BD0PyFfN/ZqIWaW5hzFIhgcTMUGPt13xfS+RxW6zogsPlXEqcHnkA5SKSsFXuRIlq+P1
	i/3N6yLt6J48t8swnUh9FQigDtvtpALmcK/bD9fv0bGlluASIeuCxDrZ8RiwV6Q7GLx8
	EE/qHeCqYc+NPAVaMFiCbWyvm8yXnUCuBPIFjIB8tHqmT4A4jTZXnoi9R4xwY9gTt9FB
	iiFQ==
X-Gm-Message-State: AA6/9RlHBi/aoU9uT4QX/uIjwkODZnbIMGg6xTBuxKGOD2603yhy5AxVuZPaBNk5vCIy2w==
X-Received: by 10.194.122.137 with SMTP id ls9mr5842742wjb.29.1475227924028;
	Fri, 30 Sep 2016 02:32:04 -0700 (PDT)
Received: from [192.168.178.23] (p57AEE603.dip0.t-ipconnect.de. [87.174.230.3])
	by smtp.gmail.com with ESMTPSA id
	c5sm18545296wjw.29.2016.09.30.02.32.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Sep 2016 02:32:03 -0700 (PDT)
To: QEMU Developers <qemu-devel@nongnu.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Thomas Huth <huth@tuxfamily.org>
Message-ID: <0e742879-8036-7c18-dfa3-4c8a8174f96a@tuxfamily.org>
Date: Fri, 30 Sep 2016 11:32:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.66
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Some updates related to the SH4
 machines
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
X-List-Received-Date: Fri, 30 Sep 2016 09:32:12 -0000

hw/intc/sh_intc.c and hw/timer/sh_timer.c seem to belong to
the R2D machine, as far as I can see.
And concerning the Shix machine, it does not make much sense
to have a "M:" entry here and the "S:" set to "Orphan". So
I'd like to suggest to use "Odd Fixes" here instead.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b821b28..e732f5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -667,10 +667,12 @@ R2D
 M: Magnus Damm <magnus.damm@gmail.com>
 S: Maintained
 F: hw/sh4/r2d.c
+F: hw/intc/sh_intc.c
+F: hw/timer/sh_timer.c
 
 Shix
 M: Magnus Damm <magnus.damm@gmail.com>
-S: Orphan
+S: Odd Fixes
 F: hw/sh4/shix.c
 
 SPARC Machines
-- 
1.8.3.1


