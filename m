Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1frjDD-0005Du-69
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2018 08:23:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marko.klopcic@isystem.si>) id 1fri5M-0007Cp-3C
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 07:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marko.klopcic@isystem.si>) id 1fri5I-0001A9-Tj
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 07:11:00 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:36110)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marko.klopcic@isystem.si>)
	id 1fri5I-00019l-Je
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 07:10:56 -0400
Received: by mail-wm0-x242.google.com with SMTP id w24-v6so13438075wmc.1
	for <qemu-trivial@nongnu.org>; Mon, 20 Aug 2018 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=isystem-si.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=eTqYZf1VQ8w0alLr3dlFBYin3ZtdWr3RXKfk3Lay7i4=;
	b=ADz5HcwmNMvdBvok2EtAh3tvJjbQvi3xAwaNmcPcNoyTL0mwLjY75qlLMa4zLU4vM+
	skw2Ki6tq595CRYg8tYuK+20t7/1MfZ/bpFxXe3dMfldBqevaExGeEOeR2WV1mHbzeiZ
	QVbJJmKjFDWJcP1F8IFkk6L9NF5gvYohK5OoXhAi49WrOZEKDdWerGLXDdq4JjVtCTr4
	PlAN28+fXQUGeMSBrmSp0Z4ajUKsVnPD19Anyli3oiog/P9VOKe5wEgGiOoWIIWYrdAY
	LV6cgeNx3da+IaGkRVPH6/BLBQiWCDRcIpPuSubPtGSBJ82bYPG6xLuS3ln6d5hh8IOD
	fDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=eTqYZf1VQ8w0alLr3dlFBYin3ZtdWr3RXKfk3Lay7i4=;
	b=QVlMLFZPk53cIyNuhRI5WIpC4YB2H/sSoxiU0TW8m4Zs/iPrETF6LHATKz/Msyg+gI
	39T12hMiznIESPSZF7qJ7iYvK62+yb0fw11719aYXePEwsbK+Bd4B0md81XzaEH8USpe
	zjO43JvJTO41UdZzjLJ5fa+Z2Edp5jFyKgNCj/dQ3JtLri6RiJo6l40RLql782HbKHBO
	S6/58lYb3zcNOfeEXy0u0CN54OP6TvOdXJtMA1077UeWQ1djx8B5fXKnQOFdvAZvNsL2
	UIZgWPTo8qAsl7QeAdSfBxo7ixRDOv62QXPQP9aGMkNdmPACTHtNTFUEIvPb71//ZGek
	iuUQ==
X-Gm-Message-State: AOUpUlE1zBdWWr7u6T3vgiVZUCXEArEB9z9Vnd0PESq3pf684YM9xbvG
	zSAu5ITih7uP7z86WldBLddzdw==
X-Google-Smtp-Source: AA+uWPzegiPNde5zSHI/t3l7h7RdjhwcdjlXQA+AJM+py8G8TVdWX/xY/agyg7NrdYBO4/W+lqiLlg==
X-Received: by 2002:a1c:55c2:: with SMTP id
	j185-v6mr26037488wmb.104.1534763455048; 
	Mon, 20 Aug 2018 04:10:55 -0700 (PDT)
Received: from [10.1.2.132] ([77.94.130.182]) by smtp.gmail.com with ESMTPSA id
	m207-v6sm12468099wma.31.2018.08.20.04.10.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 04:10:54 -0700 (PDT)
From: Marko Klopcic <marko.klopcic@isystem.si>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, mjt@tls.msk.ru
Message-ID: <2edf4dc3-5cc2-c3f3-fd40-7901e2c06413@isystem.si>
Date: Mon, 20 Aug 2018 13:10:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
X-Mailman-Approved-At: Mon, 20 Aug 2018 08:23:09 -0400
Subject: [Qemu-trivial] [PATCH] arm: fix reset operation on netduino2 board.
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
X-List-Received-Date: Mon, 20 Aug 2018 11:11:01 -0000

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <tt>Because roms are located on aliased addresses on netduino2 (</tt><tt><tt>Cortex
        M3, <br>
      </tt>STM32F205</tt><tt>), PC and SP are not read from loaded
      kernel, which means</tt><tt><br>
    </tt><tt>that the first reset fails. This fix adds additional call
      to reset.</tt><tt><br>
    </tt><tt>See more details in code comment below.</tt><tt><br>
    </tt><tt><br>
    </tt><tt>Signed-off-by: Marko Klopcic
      <a class="moz-txt-link-rfc2396E" href="mailto:marko.klopcic@isystem.si">&lt;marko.klopcic@isystem.si&gt;</a></tt><tt><br>
    </tt><tt><br>
    </tt><tt>---</tt><tt><br>
    </tt><tt> hw/arm/netduino2.c | 27 +++++++++++++++++++++++++++</tt><tt><br>
    </tt><tt> 1 file changed, 27 insertions(+)</tt><tt><br>
    </tt><tt><br>
    </tt><tt>diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c</tt><tt><br>
    </tt><tt>index f936017d4a..a2f102b14b 100644</tt><tt><br>
    </tt><tt>--- a/hw/arm/netduino2.c</tt><tt><br>
    </tt><tt>+++ b/hw/arm/netduino2.c</tt><tt><br>
    </tt><tt>@@ -25,6 +25,7 @@</tt><tt><br>
    </tt><tt> #include "qemu/osdep.h"</tt><tt><br>
    </tt><tt> #include "qapi/error.h"</tt><tt><br>
    </tt><tt> #include "hw/boards.h"</tt><tt><br>
    </tt><tt>+#include "hw/loader.h"</tt><tt><br>
    </tt><tt> #include "qemu/error-report.h"</tt><tt><br>
    </tt><tt> #include "hw/arm/stm32f205_soc.h"</tt><tt><br>
    </tt><tt> #include "hw/arm/arm.h"</tt><tt><br>
    </tt><tt>@@ -39,6 +40,32 @@ static void netduino2_init(MachineState
      *machine)</tt><tt><br>
    </tt><tt> </tt><tt><br>
    </tt><tt>     armv7m_load_kernel(ARM_CPU(first_cpu),
      machine-&gt;kernel_filename,</tt><tt><br>
    </tt><tt>                        FLASH_SIZE);</tt><tt><br>
    </tt><tt>+</tt><tt><br>
    </tt><tt>+    /* </tt><tt><br>
    </tt><tt>+      The following two calls are a workaround for problem
      with rom on aliased</tt><tt><br>
    </tt><tt>+      addresses on STM32.</tt><tt><br>
    </tt><tt>+      Kernel is loaded into Rom objects, which are stored
      in loader.c. Roms</tt><tt><br>
    </tt><tt>+      are copied to memory in:</tt><tt><br>
    </tt><tt>+      </tt><tt><br>
    </tt><tt>+      void rom_reset() {</tt><tt><br>
    </tt><tt>+        ...</tt><tt><br>
    </tt><tt>+         cpu_physical_memory_write_rom(rom-&gt;as,
      rom-&gt;addr, rom-&gt;data,</tt><tt><br>
    </tt><tt>+                                       rom-&gt;datasize);</tt><tt><br>
    </tt><tt>+        ...</tt><tt><br>
    </tt><tt>+      }</tt><tt><br>
    </tt><tt>+</tt><tt><br>
    </tt><tt>+      However, since CPU reset is registered BEFORE</tt><tt><br>
    </tt><tt>+      rom_reset(), SP and PC are read from memory BEFORE
      roms are copied to</tt><tt><br>
    </tt><tt>+      memory. CPU reset also checks Roms for data, so this
      is normally not a</tt><tt><br>
    </tt><tt>+      problem, but in STM32 PC and SP are read from
      aliased memory, and these</tt><tt><br>
    </tt><tt>+      memory addresses are not mapped to Roms. Since ROMs
      are private in</tt><tt><br>
    </tt><tt>+      loader.c the only option to copy Roms to memory is
      through reset. So we</tt><tt><br>
    </tt><tt>+      first have to register Roms for reset, and then
      trigger system reset, which</tt><tt><br>
    </tt><tt>+      copies Roms to mem, so that reset vectors are in
      memory, when</tt><tt><br>
    </tt><tt>+      qemu_system_reset() is called again from main().</tt><tt><br>
    </tt><tt>+     */</tt><tt><br>
    </tt><tt>+    rom_check_and_register_reset();</tt><tt><br>
    </tt><tt>+    qemu_system_reset(SHUTDOWN_CAUSE_NONE);</tt><tt><br>
    </tt><tt> }</tt><tt><br>
    </tt><tt> </tt><tt><br>
    </tt><tt> static void netduino2_machine_init(MachineClass *mc)</tt><tt><br>
    </tt><tt>-- </tt><tt><br>
    </tt><tt>2.14.1</tt><tt><br>
    </tt><tt><br>
    </tt><tt><br>
    </tt>
  </body>
</html>

