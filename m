Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzhTo-0005Xd-DN
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2019 07:41:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gzhTh-0005AV-4x
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 07:41:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gzhLQ-0004qW-9E
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 07:32:53 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gzhLJ-0004mz-Tz
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 07:32:47 -0500
Received: by mail-wm1-f68.google.com with SMTP id m1so12421329wml.2
	for <qemu-trivial@nongnu.org>; Fri, 01 Mar 2019 04:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=02wy9pROp2/fuPUdoK1BAopWPIGDbgOYhqkNt65nz/8=;
	b=Fy4I96gnzdtfz/wiIGmVry0Dvq7W70nE34nnnoxxpwSzun0fPe5Xg1+VhhEPeSE18H
	JqCIOe3/i68ySCzZbD346R2Fznzwu6D0G2gw5QHVbeA6O3b50yt4s97ifngG6+jEEsL/
	TPC40JRD5vPJG0tC838ji1f3m4qvjnnvsPOOUNHLxUbwOLjDIrNBj/mxBJMXVWsPyYYe
	pHLeztJi+SdW7qqJzIwVGHvqS+9Jc5fn54nQzfK9Esd7pENZop1TXceVm54VDVAP6i6c
	4GJayAH82zNEw3+VvQqTzEY+67Cuhnpu4O4aLAZHnGqRpR1tdq/XRu6b8TvgwMFAjfP7
	4pUw==
X-Gm-Message-State: AHQUAub6dktgBo16A5ScGXdH0xqQko9ura71MIgMGirjo0yjail+I+nd
	f+6nPipTK5mZL/aPxqb5vuSe89cOX8E=
X-Google-Smtp-Source: APXvYqwtDfLiiA+yiqKYffkdR4kSHv+5rAgRq6xLj1VK7wrqPQl4PU59oO8VejYal6gytXIvRXGKyw==
X-Received: by 2002:a1c:6854:: with SMTP id d81mr2986824wmc.1.1551443564387;
	Fri, 01 Mar 2019 04:32:44 -0800 (PST)
Received: from [10.201.33.238] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	j8sm27322800wro.52.2019.03.01.04.32.43
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 04:32:43 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org
References: <1551111298-8445-1-git-send-email-thuth@redhat.com>
	<2da5f950-ab74-355a-6019-add964ddb43c@redhat.com>
	<7883d30d-6ecc-7206-8636-b9c920268319@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2c2adf9f-01c6-613b-889b-40aa48c42578@redhat.com>
Date: Fri, 1 Mar 2019 13:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <7883d30d-6ecc-7206-8636-b9c920268319@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [PATCH] hw/nvram/fw_cfg: Move
 boot_splash_filedata variables into fw_cfg.c
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
X-List-Received-Date: Fri, 01 Mar 2019 12:41:27 -0000

Hi Thomas,

On 3/1/19 12:28 PM, Thomas Huth wrote:
> On 25/02/2019 19.31, Laszlo Ersek wrote:
>> Hi Thomas,
>>
>> On 02/25/19 17:14, Thomas Huth wrote:
>>> The global boot_splash_filedata and boot_splash_filedata_size variables
>>> are only used in fw_cfg.c. So there is really no need that these need
>>> to be global and reside in vl.c. Move them to fw_cfg.c instead.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  hw/nvram/fw_cfg.c         |  9 +++++++++
>>>  include/hw/nvram/fw_cfg.h |  1 +
>>>  include/sysemu/sysemu.h   |  2 --
>>>  vl.c                      | 10 +---------
>>>  4 files changed, 11 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
>>> index 7fdf04a..15f0023 100644
>>> --- a/hw/nvram/fw_cfg.c
>>> +++ b/hw/nvram/fw_cfg.c
>>> @@ -63,6 +63,9 @@ struct FWCfgEntry {
>>>  #define JPG_FILE 0
>>>  #define BMP_FILE 1
>>>  
>>> +static uint8_t *boot_splash_filedata;
>>> +static size_t boot_splash_filedata_size;
>>> +
>>>  static char *read_splashfile(char *filename, gsize *file_sizep,
>>>                               int *file_typep)
>>>  {
>>> @@ -175,6 +178,12 @@ static void fw_cfg_bootsplash(FWCfgState *s)
>>>      }
>>>  }
>>>  
>>> +void fw_cfg_res_free(void)
>>> +{
>>> +    g_free(boot_splash_filedata);
>>> +    boot_splash_filedata = NULL;
>>> +}
>>> +
>>>  static void fw_cfg_reboot(FWCfgState *s)
>>>  {
>>>      const char *reboot_timeout = NULL;
>>> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
>>> index f5a6895..16d237c 100644
>>> --- a/include/hw/nvram/fw_cfg.h
>>> +++ b/include/hw/nvram/fw_cfg.h
>>> @@ -225,5 +225,6 @@ FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
>>>  
>>>  FWCfgState *fw_cfg_find(void);
>>>  bool fw_cfg_dma_enabled(void *opaque);
>>> +void fw_cfg_res_free(void);
>>>  
>>>  #endif
>>> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
>>> index 4b5a6b7..63a5eed 100644
>>> --- a/include/sysemu/sysemu.h
>>> +++ b/include/sysemu/sysemu.h
>>> @@ -111,8 +111,6 @@ extern int no_shutdown;
>>>  extern int old_param;
>>>  extern int boot_menu;
>>>  extern bool boot_strict;
>>> -extern uint8_t *boot_splash_filedata;
>>> -extern size_t boot_splash_filedata_size;
>>>  extern bool enable_mlock;
>>>  extern bool enable_cpu_pm;
>>>  extern QEMUClockType rtc_clock;
>>> diff --git a/vl.c b/vl.c
>>> index 502857a..f769cce 100644
>>> --- a/vl.c
>>> +++ b/vl.c
>>> @@ -187,8 +187,6 @@ unsigned int nb_prom_envs = 0;
>>>  const char *prom_envs[MAX_PROM_ENVS];
>>>  int boot_menu;
>>>  bool boot_strict;
>>> -uint8_t *boot_splash_filedata;
>>> -size_t boot_splash_filedata_size;
>>>  bool wakeup_suspend_enabled;
>>>  
>>>  int icount_align_option;
>>> @@ -559,12 +557,6 @@ const char *qemu_get_vm_name(void)
>>>      return qemu_name;
>>>  }
>>>  
>>> -static void res_free(void)
>>> -{
>>> -    g_free(boot_splash_filedata);
>>> -    boot_splash_filedata = NULL;
>>> -}
>>> -
>>>  static int default_driver_check(void *opaque, QemuOpts *opts, Error **errp)
>>>  {
>>>      const char *driver = qemu_opt_get(opts, "driver");
>>> @@ -4585,7 +4577,7 @@ int main(int argc, char **argv, char **envp)
>>>      job_cancel_sync_all();
>>>      bdrv_close_all();
>>>  
>>> -    res_free();
>>> +    fw_cfg_res_free();
>>>  
>>>      /* vhost-user must be cleaned up before chardevs.  */
>>>      tpm_cleanup();
>>>
>>
>> The res_free() function call in main() goes back to commit 3d3b8303c6f8
>> ("showing a splash picture when start", 2011-07-29). That seems to be
>> the original addition of the bootsplash feature. And, res_free() appears
>> to simply release dynamic memory before the QEMU process exits.
>>
>> Do we release malloc'd memory, as a general rule, before we exit the
>> QEMU process (with exit status 0)? My impression has been that we don't
>> care; we just let the kernel forget about all memory that the QEMU
>> process used to own.
>>
>> If that's the case, I suggest to respin this patch, deleting res_free()
>> completely. AFAICS there are no other call sites. That would be a nice
>> improvement IMO (we wouldn't have to extend "include/hw/nvram/fw_cfg.h").
> 
> Hmm, thinking about this for a while, the fw_cfg is a qdev device, so I
> think we should at least add an unrealize() function where we clean up
> the allocated memory, even if the unrealize function is currently not
> called yet, since the device never gets destroyed...

I worked on a similar cleanup last month, I can submit it this
afternoon. Do you mind having a look at it before reworking this patch?
I'm not sure which one is the best, but since the work is already done I
don't want any of us waste his time :)

Thanks,

Phil.

