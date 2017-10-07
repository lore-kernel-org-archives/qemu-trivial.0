Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cmm-0003o2-AO
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 20:16:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1e0cmk-0003m6-2g
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 20:16:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shorne@gmail.com>) id 1e0cmi-0005CK-Ur
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 20:16:05 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:38895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shorne@gmail.com>)
	id 1e0cme-00059G-GU; Fri, 06 Oct 2017 20:16:00 -0400
Received: by mail-pg0-x244.google.com with SMTP id j3so4010277pga.5;
	Fri, 06 Oct 2017 17:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=6Mn/omst6vUhY1W54Z5Ii03ybYwcO6mK4JpB6g0YFxQ=;
	b=lMUgUtWUkKVZmyDyJ0vYBTinZtRt9DioBTx7RPyCIWleu3n/AUgwaRxCE+XnqbIEVo
	f+u+Ya5D7O2h6/AS+uiSAxElqGGocSfgZSQmqVg1cisB8Rdlv7wc49Gu8Ff/MCKfBpU7
	B7uxRl+Y8Ad/qYyzO29v//5o5W8yBUhtVjxlB4OefBrJJTBlP3lyhXaruNwckmlEoF7Q
	XRdrTr8P1lnUIYumnbAc3g935wBg70wUgRM3IaINIZYGnDGGwB5R2UZ0JeynU/S6wymu
	dFKFoUW6d0yaYwkEehc1vq8XCn9mR34602qBhCo6S83S/v2ToF4qukSWSbfPGvb/oSAL
	fTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=6Mn/omst6vUhY1W54Z5Ii03ybYwcO6mK4JpB6g0YFxQ=;
	b=DrS1Nhy0zLMwaKFlXFtE4TbySImBHXGbXGuN6JonhsjMR0Ye+P5UCv38QDL1/UWUTA
	xYcMD2Nz0UQh4N/19DWR49e4YW0VbVStMNdkpRK5aTIsjSvlSdNxwN2EDQmiyl51O7N2
	NFz2jf/2qpu0szhsl7kTOzPGAIpJ229YtC23yVa0Ss0/v3oChWMDVHiEr3N7Bn3JpYtL
	vCw1lwK2ungLCGcL8aNkXPwdtp2ArQYdgp33J+/i2yxgYaHIIC/dNWIX+MjNf6/o+BAp
	rzVoYZat/X4ARCMAg/4+GC0kkE+EvP2MBQdFJt5SSKCmDb5isXqQmOmyGw3JLIGQQR9M
	7eRg==
X-Gm-Message-State: AMCzsaWQ5HgQ/Pm5cQFc/enLHk90HjsFhYQmPYOVvaYuQOKrsIuS58gO
	cUZ98zjZw3GVv+sLIsLD9OB76RpNLmc=
X-Google-Smtp-Source: AOwi7QC7a92pdCEloKjb5vuyK86x4C3EgOCpgxoWMM5y1wJuCOQVEpUw++Z6V6z95mc5KUW1tojU5w==
X-Received: by 10.84.214.151 with SMTP id j23mr3364310pli.21.1507335359636;
	Fri, 06 Oct 2017 17:15:59 -0700 (PDT)
Received: from localhost (g100.58-98-169.ppp.wakwak.ne.jp. [58.98.169.100])
	by smtp.gmail.com with ESMTPSA id c7sm5342815pfg.85.2017.10.06.17.15.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Oct 2017 17:15:59 -0700 (PDT)
Date: Sat, 7 Oct 2017 09:15:57 +0900
From: Stafford Horne <shorne@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>, Jia Liu <proljc@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Message-ID: <20171007001557.GE2630@lianli.shorne-pla.net>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-26-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171006235023.11952-26-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-trivial] [PATCH 25/88] OpenRISC: use g_new() family of
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
X-List-Received-Date: Sat, 07 Oct 2017 00:16:07 -0000

On Fri, Oct 06, 2017 at 08:49:20PM -0300, Philippe Mathieu-Daudé wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: Stafford Horne <shorne@gmail.com>

> [PMD: squashed openrisc_sim.c]
> ---
>  hw/openrisc/openrisc_sim.c | 2 +-
>  target/openrisc/mmu.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index 86bf2849c4..1eb381549c 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -114,7 +114,7 @@ static void openrisc_sim_init(MachineState *machine)
>          main_cpu_reset(cpu);
>      }
>  
> -    ram = g_malloc(sizeof(*ram));
> +    ram = g_new(MemoryRegion, 1);
>      memory_region_init_ram(ram, NULL, "openrisc.ram", ram_size, &error_fatal);
>      memory_region_add_subregion(get_system_memory(), 0, ram);
>  
> diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
> index ce2a29dd1a..4789a35b67 100644
> --- a/target/openrisc/mmu.c
> +++ b/target/openrisc/mmu.c
> @@ -247,7 +247,7 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>  
>  void cpu_openrisc_mmu_init(OpenRISCCPU *cpu)
>  {
> -    cpu->env.tlb = g_malloc0(sizeof(CPUOpenRISCTLBContext));
> +    cpu->env.tlb = g_new0(CPUOpenRISCTLBContext, 1);
>  
>      cpu->env.tlb->cpu_openrisc_map_address_code = &cpu_openrisc_get_phys_nommu;
>      cpu->env.tlb->cpu_openrisc_map_address_data = &cpu_openrisc_get_phys_nommu;
> -- 
> 2.14.2
> 

