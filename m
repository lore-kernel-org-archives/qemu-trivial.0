Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzgL0-0004IG-Un
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2019 06:28:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gzgKy-0004Gg-0y
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 06:28:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gzgKx-0000gU-2j
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2019 06:28:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60812)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gzgKu-0000d9-O0; Fri, 01 Mar 2019 06:28:17 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D34FA3175582;
	Fri,  1 Mar 2019 11:28:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-112.ams2.redhat.com [10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79A075D707;
	Fri,  1 Mar 2019 11:28:09 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org
References: <1551111298-8445-1-git-send-email-thuth@redhat.com>
	<2da5f950-ab74-355a-6019-add964ddb43c@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
	yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
	4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
	tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
	0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
	O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
	0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
	gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
	3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
	zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzRxUaG9tYXMgSHV0
	aCA8dGguaHV0aEBnbXguZGU+wsF7BBMBAgAlAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIX
	gAUCUfuWKwIZAQAKCRAu2dd0/nAttbe/EACb9hafyOb2FmhUqeAiBORSsUifFacQ7laVjcgR
	I4um8CSHvxijYftpkM2EdAtmXIKgbNDpQoXcWLXB9lu9mLgTO4DVT00TRR65ikn3FCWcyT74
	ENTOzRKyKLsDCjhXKPblTPIQbYAUCOWElcyAPm0ERd62fA/rKNxgIiNo/l4UODOMoOJm2/Ox
	ZoTckW68Eqv7k9L7m7j+Hn3hoDTjAmcCBJt+j7pOhzWvCbqoNOIH8C8qvPaNlrba+R/K6jkO
	6jZkTbYQpGIofEQJ/TNn38IsNGpI1ALTHWFtoMxp3j2Imz0REO6dRE2fHRN8sVlHgkoeGhmY
	NbDsDE1jFQOEObFnu0euk//7BXU7tGOHckVAZ8T1smiRPHfQU7UEH2a/grndxJ+PNeM5w7n2
	l+FN3cf2KgPotCK2s9MjSdZA7C5e3rFYO8lqiqTJKvc62vqp3e7B0Kjyy5/QtzSOejBij2QL
	xkKSFNtxIz4MtuxN8e3IDQNxsKry3nF7R4MDvouXlMo6wP9KuyNWb+vFJt9GtbgfDMIFVamp
	ZfhEWzWRJH4VgksENA4K/BzjEHCcbTUb1TFsiB1VRnBPJ0SqlvifnfKk6HcpkDk6Pg8Q5FOJ
	gbNHrdgXsm+m/9GF2zUUr+rOlhVbK23TUqKqPfwnD7uxjpakVcJnsVCFqJpZi1F/ga9IN87B
	TQRR+3lMARAAtp831HniPHb9AuKq3wj83ujZK8lH5RLrfVsB4X1wi47bwo56BqhXpR/zxPTR
	eOFT0gnbw9UkphVc7uk/alnXMDEmgvnuxv89PwIQX6k3qLABeV7ykJQG/WT5HQ6+2DdGtVw3
	2vjYAPiWQeETsgWRRQMDR0/hwp8s8tL/UodwYCScH6Vxx9pdy353L1fK4Bb9G73a+9FPjp9l
	x+WwKTsltVqSBuSjyZQ3c3EE8qbTidXZxB38JwARH8yN3TX+t65cbBqLl/zRUUUTapHQpUEd
	yoAsHIml32e4q+3xdLtTdlLi7FgPBItSazcqZPjEcYW73UAuLcmQmfJlQ5PkDiuqcitn+KzH
	/1pqsTU7QFZjbmSMJyXY0TDErOFuMOjf20b6arcpEqse1V3IKrb+nqqA2azboRm3pEANLAJw
	iVTwK3qwGRgK5ut6N/Znv20VEHkFUsRAZoOusrIRfR5HFDxlXguAdEz8M/hxXFYYXqOoaCYy
	6pJxTjy0Y/tIfmS/g9Bnp8qg9wsrsnk0+XRnDVPak++G3Uq9tJPwpJbyO0vcqEI3vAXkAB7X
	VXLzvFwi66RrsPUoDkuzj+aCNumtOePDOCpXQGPpKl+l1aYRMN/+lNSk3+1sVuc2C07WnYyE
	gV/cbEVklPmKrNwu6DeUyD0qI/bVzKMWZAiB1r56hsGeyYcAEQEAAcLBXwQYAQIACQUCUft5
	TAIbDAAKCRAu2dd0/nAttYTwEACLAS/THRqXRKb17PQmKwZHerUvZm2klo+lwQ3wNQBHUJAT
	p2R9ULexyXrJPqjUpy7+voz+FcKiuQBTKyieiIxO46oMxsbXGZ70o3gxjxdYdgimUD6U8PPd
	JH8tfAL4BR5FZNjspcnscN2jgbF4OrpDeOLyBaj6HPmElNPtECHWCaf1xbIFsZxSDGMA6cUh
	0uX3Q8VI7JN1AR2cfiIRY7NrIlWYucJxyKjO3ivWm69nCtsHiJ0wcF8KlVo7F2eLaufo0K8A
	ynL8SHMF3VEyxsXOP2f1UR9T2Ur30MXcTBpjUxml1TX3RWY5uH89Js/jlIugBwuAmacJ7JYh
	lTg6sF/GNc4nPb4kk2yktNWTade+TzsllYlJPaorD2Qe8qX0iFUhFC6y9+O6mP4ZvWoYapp9
	ezYNuebMgEr93ob1+4sFg3812wNP01WqsGtWCJHnPv/JoonFdMzD/bIkXGEJMk6ks2kxQQZq
	g6Ik/s/vxOfao/xCn8nHt7GwvVy41795hzK6tbSl+BuyCRp0vfPRP34OnK7+jR2nvQpJu/pU
	rCELuGwT9hsYkUPjVd4lfylN3mzEc6iAv/wwjsc0DRTSQCpXT3v2ymTAsRKrVaEZLibTXaf+
	WslxWek3xNYRiqwwWAJuL652eAlxUgQ5ZS+fXBRTiQpJ+F26I/2lccScRd9G5w==
Organization: Red Hat
Message-ID: <7883d30d-6ecc-7206-8636-b9c920268319@redhat.com>
Date: Fri, 1 Mar 2019 12:28:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <2da5f950-ab74-355a-6019-add964ddb43c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 01 Mar 2019 11:28:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 01 Mar 2019 11:28:21 -0000

On 25/02/2019 19.31, Laszlo Ersek wrote:
> Hi Thomas,
> 
> On 02/25/19 17:14, Thomas Huth wrote:
>> The global boot_splash_filedata and boot_splash_filedata_size variables
>> are only used in fw_cfg.c. So there is really no need that these need
>> to be global and reside in vl.c. Move them to fw_cfg.c instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/nvram/fw_cfg.c         |  9 +++++++++
>>  include/hw/nvram/fw_cfg.h |  1 +
>>  include/sysemu/sysemu.h   |  2 --
>>  vl.c                      | 10 +---------
>>  4 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
>> index 7fdf04a..15f0023 100644
>> --- a/hw/nvram/fw_cfg.c
>> +++ b/hw/nvram/fw_cfg.c
>> @@ -63,6 +63,9 @@ struct FWCfgEntry {
>>  #define JPG_FILE 0
>>  #define BMP_FILE 1
>>  
>> +static uint8_t *boot_splash_filedata;
>> +static size_t boot_splash_filedata_size;
>> +
>>  static char *read_splashfile(char *filename, gsize *file_sizep,
>>                               int *file_typep)
>>  {
>> @@ -175,6 +178,12 @@ static void fw_cfg_bootsplash(FWCfgState *s)
>>      }
>>  }
>>  
>> +void fw_cfg_res_free(void)
>> +{
>> +    g_free(boot_splash_filedata);
>> +    boot_splash_filedata = NULL;
>> +}
>> +
>>  static void fw_cfg_reboot(FWCfgState *s)
>>  {
>>      const char *reboot_timeout = NULL;
>> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
>> index f5a6895..16d237c 100644
>> --- a/include/hw/nvram/fw_cfg.h
>> +++ b/include/hw/nvram/fw_cfg.h
>> @@ -225,5 +225,6 @@ FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
>>  
>>  FWCfgState *fw_cfg_find(void);
>>  bool fw_cfg_dma_enabled(void *opaque);
>> +void fw_cfg_res_free(void);
>>  
>>  #endif
>> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
>> index 4b5a6b7..63a5eed 100644
>> --- a/include/sysemu/sysemu.h
>> +++ b/include/sysemu/sysemu.h
>> @@ -111,8 +111,6 @@ extern int no_shutdown;
>>  extern int old_param;
>>  extern int boot_menu;
>>  extern bool boot_strict;
>> -extern uint8_t *boot_splash_filedata;
>> -extern size_t boot_splash_filedata_size;
>>  extern bool enable_mlock;
>>  extern bool enable_cpu_pm;
>>  extern QEMUClockType rtc_clock;
>> diff --git a/vl.c b/vl.c
>> index 502857a..f769cce 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -187,8 +187,6 @@ unsigned int nb_prom_envs = 0;
>>  const char *prom_envs[MAX_PROM_ENVS];
>>  int boot_menu;
>>  bool boot_strict;
>> -uint8_t *boot_splash_filedata;
>> -size_t boot_splash_filedata_size;
>>  bool wakeup_suspend_enabled;
>>  
>>  int icount_align_option;
>> @@ -559,12 +557,6 @@ const char *qemu_get_vm_name(void)
>>      return qemu_name;
>>  }
>>  
>> -static void res_free(void)
>> -{
>> -    g_free(boot_splash_filedata);
>> -    boot_splash_filedata = NULL;
>> -}
>> -
>>  static int default_driver_check(void *opaque, QemuOpts *opts, Error **errp)
>>  {
>>      const char *driver = qemu_opt_get(opts, "driver");
>> @@ -4585,7 +4577,7 @@ int main(int argc, char **argv, char **envp)
>>      job_cancel_sync_all();
>>      bdrv_close_all();
>>  
>> -    res_free();
>> +    fw_cfg_res_free();
>>  
>>      /* vhost-user must be cleaned up before chardevs.  */
>>      tpm_cleanup();
>>
> 
> The res_free() function call in main() goes back to commit 3d3b8303c6f8
> ("showing a splash picture when start", 2011-07-29). That seems to be
> the original addition of the bootsplash feature. And, res_free() appears
> to simply release dynamic memory before the QEMU process exits.
> 
> Do we release malloc'd memory, as a general rule, before we exit the
> QEMU process (with exit status 0)? My impression has been that we don't
> care; we just let the kernel forget about all memory that the QEMU
> process used to own.
> 
> If that's the case, I suggest to respin this patch, deleting res_free()
> completely. AFAICS there are no other call sites. That would be a nice
> improvement IMO (we wouldn't have to extend "include/hw/nvram/fw_cfg.h").

Hmm, thinking about this for a while, the fw_cfg is a qdev device, so I
think we should at least add an unrealize() function where we clean up
the allocated memory, even if the unrealize function is currently not
called yet, since the device never gets destroyed...

 Thomas

