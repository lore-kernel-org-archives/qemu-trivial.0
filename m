Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldGnp-0000Vs-VJ
	for mharc-qemu-trivial@gnu.org; Sun, 02 May 2021 14:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldGnn-0000UF-Hy; Sun, 02 May 2021 14:26:47 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldGnl-0000VA-Oy; Sun, 02 May 2021 14:26:47 -0400
Received: from [192.168.100.1] ([82.142.20.222]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M2OEq-1lZPBN3sYI-003sCC; Sun, 02 May 2021 20:26:28 +0200
Subject: Re: [PATCH-for-6.0?] hw/rx/rx-gdbsim: Do not accept invalid memory
 size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20210407223056.1870497-1-f4bug@amsat.org>
 <dd370961-09fb-0dce-4527-e7490c9e8488@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3cc4fcdc-18a8-bbd7-6d4e-116129283dd7@vivier.eu>
Date: Sun, 2 May 2021 20:26:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dd370961-09fb-0dce-4527-e7490c9e8488@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SchIq+yAqxOxhiOuCaQ08DiDW0GeIqrGb1+4ZtSAsUchU4puxyG
 8uvPQ6X7VSm4SnOT6GWvMsKYLFKBD5VxMgVX4lAgbhpF8rOwEjnQ/ihrkL1liK8cTdER64V
 Iz1feT8RZEMD64cHfPlz9ae8WFhcSavFXZiZ8jaMi9YcoQsRZ6opLkBpVj+tNz3LDJUalL0
 eRyzs4a5UiDl2OAEuQZOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0wOFndYwsjA=:xPU0fM3OfjEmDf6cy64VGo
 rIn1DqyeDARN/5Goer88AZqBlXWxQTif3g8sIQardQkI/RYDjAUvkNCOVBQlhpAkMGkJWM8mo
 hhg+6wLxKUEEG4P2uya4KZ+c6tsNwypZHJPQUyHc5l9PIcUA0meDIzFENn8yj8DHqtNa24Bzd
 4GhD/FjA36IffBjgl67s5sdcevjQ/VskEi2VC8tFKj4JMTzhxngWfX5PJCzVk85blnSuX2yoE
 9Rr1DMJlRm6UPsCwI7eQxpd8NZKlG1jIzBF5bn6fVqxqGRuvBBY3ezk6Y0V/weJ20mZYpjqNr
 8CtLTLNoQVzqoHAdW19KnEqnX/Yi8nJbagSHtuf8hSB/ui/7r6sKwZJ+rIrdf1eTQ8JMyO9Zt
 /zokT+9bItvAudMDLY+4NKJZPfM2PMgtfL9IXelpb/9sc1nScpeOZuipTuXoV/uTQ2p6BlBlk
 aGI3tS+iT76TOVk0mVgUd2AlvjV2Q9cnsLYulxqM73i+5clavEL9JDxzEmZG5bbT3azHoIz0K
 GfNG/ZcwwDzRq4qGv7Mo4I=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 02 May 2021 18:26:47 -0000

Le 02/05/2021 à 18:27, Philippe Mathieu-Daudé a écrit :
> Hi Laurent, could you take this patch via your Trivial tree please?
> 
> On 4/8/21 12:30 AM, Philippe Mathieu-Daudé wrote:
>> We check the amount of RAM is enough, warn when it is
>> not, but if so we neglect to bail out. Fix that by
>> adding the missing exit() call.
>>
>> Fixes: bda19d7bb56 ("hw/rx: Add RX GDB simulator")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/rx/rx-gdbsim.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
>> index b1d7c2488ff..4e4ececae4b 100644
>> --- a/hw/rx/rx-gdbsim.c
>> +++ b/hw/rx/rx-gdbsim.c
>> @@ -93,6 +93,7 @@ static void rx_gdbsim_init(MachineState *machine)
>>          char *sz = size_to_str(mc->default_ram_size);
>>          error_report("Invalid RAM size, should be more than %s", sz);
>>          g_free(sz);
>> +        exit(1);
>>      }
>>  
>>      /* Allocate memory space */
>>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


