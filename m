Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jrG7V-0003tg-Vp
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2020 03:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1jrG7U-0003sQ-Qu; Fri, 03 Jul 2020 03:28:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:49702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1jrG7S-0007Vr-SO; Fri, 03 Jul 2020 03:28:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFE93AECB;
 Fri,  3 Jul 2020 07:28:18 +0000 (UTC)
Subject: Re: [PATCH] softmmu/vl: Remove the check for colons in -accel
 parameters
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20200618074001.13642-1-thuth@redhat.com>
 <1a135eb1-8ea6-80f2-85d7-40c8da92c1d1@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8fa5c3d8-57f7-a816-1201-b77143e7dfc6@suse.de>
Date: Fri, 3 Jul 2020 09:28:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1a135eb1-8ea6-80f2-85d7-40c8da92c1d1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 23:00:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jul 2020 07:28:25 -0000

On 7/3/20 7:34 AM, Thomas Huth wrote:
> On 18/06/2020 09.40, Thomas Huth wrote:
>> The new -accel option does not accept colons in the parameters anymore
>> (since it does not convert the parameters to -machine accel=... parameters
>> anymore). Thus we can now remove the check for colons in -accel:
>>
>> $ qemu-system-x86_64 -accel kvm:tcg
>> qemu-system-x86_64: -accel kvm:tcg: invalid accelerator kvm:tcg
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   softmmu/vl.c | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index f669c06ede..273acfcf6b 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -3485,11 +3485,6 @@ void qemu_init(int argc, char **argv, char **envp)
>>                       g_slist_free(accel_list);
>>                       exit(0);
>>                   }
>> -                if (optarg && strchr(optarg, ':')) {
>> -                    error_report("Don't use ':' with -accel, "
>> -                                 "use -M accel=... for now instead");
>> -                    exit(1);
>> -                }
>>                   break;
>>               case QEMU_OPTION_usb:
>>                   olist = qemu_find_opts("machine");
>>
> 
> Ping?
> 
>   Thomas
> 
> 

Reviewed-by: Claudio Fontana <cfontana@suse.de>

