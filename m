Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPX-00085W-Kn
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPV-000837-8g
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPU-0005ac-E3
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:05 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:56433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPP-0005Uz-Vr; Fri, 06 Oct 2017 19:52:00 -0400
Received: by mail-qt0-x244.google.com with SMTP id 34so17237217qtb.13;
	Fri, 06 Oct 2017 16:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xIkpRsC3b3p6qItOzQoh1KWmSKmw09Nf7M6G00siPI8=;
	b=qOopt5febR6cfxzeB3z6r+0hwtAKmrVlHEmWy4s0dfrj76znGjh7x9+6qSSwpFG3Eg
	fGW0wm4lcmGY6wL9oEzm27NbrTIWf1JBMjNZ2It6wkZXHgA36uRauc4n9W5XTZppy0d+
	Vb5Z1qh/GncWckYmV1Pp5+jhwwWBz573FBsUgPzxlwjYQCL8S60h3YXSzT3I7FNMdDyR
	2JWkd85Xk3+uLB1XUIcy46P4jgjwa1gggDYjStQcz2ByZw1qoZ3RUlOzPZKBBxb+meW0
	IYlqW4F31BOUeWekppn7H2s/Z03fw9aP6QZCCwHKxP7PVwvt974IpjiIXgNFJECNxNO1
	eAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xIkpRsC3b3p6qItOzQoh1KWmSKmw09Nf7M6G00siPI8=;
	b=s9A//neN3xSvqip4b72Nj6j/CCPmcTsFE75NEac3rSXcizrE4R9T80GtLIABOMZAax
	7u9dhwyldUevc7nj0y62DAmQ1hWNW1Z7hepa/Dp+d+W0FjNMyoUm+uVnwcYONI1eh0yD
	AK70l+zdgBGR7qWu7WBU+kQe7F7VZGRML2ldRfhSB6OOewUXcksNN4E3qtQr6Va+M/vh
	H2X+UrXsmP9Hje/5wEcjdDfLTHczZQrI1vahf3R4vSnMHd/6KuJZTavNp1Hmp/dBPOGj
	vzpCq3DgSa+iAERiW0u7KcrmPD96ktZE0Hfgw7ay4hrB7K2/4ImSSvNN4esosBd83lne
	z+Sg==
X-Gm-Message-State: AMCzsaXrIZWyhYcRRwtZICJFrF4zUlzBmNHaIVE0DRcntMjHXC5gI1H+
	xnsieoS1fe+eJSNf7SeuOBU=
X-Google-Smtp-Source: AOwi7QBJJ3HvzwKXT+LSBpjW5WBUWMYvpw8bATzhHmM3z+NkDITZy0ATP3yLkthZxxs9Vi08HPbSIw==
X-Received: by 10.200.39.205 with SMTP id x13mr5238190qtx.287.1507333919461;
	Fri, 06 Oct 2017 16:51:59 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:20 -0300
Message-Id: <20171006235023.11952-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 25/88] OpenRISC: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:06 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: squashed openrisc_sim.c]
---
 hw/openrisc/openrisc_sim.c | 2 +-
 target/openrisc/mmu.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 86bf2849c4..1eb381549c 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -114,7 +114,7 @@ static void openrisc_sim_init(MachineState *machine)
         main_cpu_reset(cpu);
     }
 
-    ram = g_malloc(sizeof(*ram));
+    ram = g_new(MemoryRegion, 1);
     memory_region_init_ram(ram, NULL, "openrisc.ram", ram_size, &error_fatal);
     memory_region_add_subregion(get_system_memory(), 0, ram);
 
diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index ce2a29dd1a..4789a35b67 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -247,7 +247,7 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 
 void cpu_openrisc_mmu_init(OpenRISCCPU *cpu)
 {
-    cpu->env.tlb = g_malloc0(sizeof(CPUOpenRISCTLBContext));
+    cpu->env.tlb = g_new0(CPUOpenRISCTLBContext, 1);
 
     cpu->env.tlb->cpu_openrisc_map_address_code = &cpu_openrisc_get_phys_nommu;
     cpu->env.tlb->cpu_openrisc_map_address_data = &cpu_openrisc_get_phys_nommu;
-- 
2.14.2


