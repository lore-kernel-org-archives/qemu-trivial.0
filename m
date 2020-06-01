Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfmy5-0001r7-NJ
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 12:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jfmy4-0001o2-2y
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 12:07:16 -0400
Received: from 9.mo68.mail-out.ovh.net ([46.105.78.111]:50320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jfmy2-0000Ge-Mu
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 12:07:15 -0400
Received: from player695.ha.ovh.net (unknown [10.108.35.95])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id D3B0616C2CE
 for <qemu-trivial@nongnu.org>; Mon,  1 Jun 2020 18:07:04 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 55E0D12CAB066;
 Mon,  1 Jun 2020 16:06:43 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b8d09b32-b5d3-4353-abb8-6409bc852004,83E988B7E4CB5EF414800AC4A3AAD9DE61AE43FA)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 1/8] hw/arm/aspeed: Correct DRAM container region size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, Anthony Perard
 <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Helge Deller <deller@gmx.de>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-2-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <10b20388-ee7a-9a61-83d5-7686369dab20@kaod.org>
Date: Mon, 1 Jun 2020 18:06:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2857533967562673072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudefhedgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhtrhhivhhirghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.78.111; envelope-from=clg@kaod.org;
 helo=9.mo68.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 12:07:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 01 Jun 2020 16:07:16 -0000

On 6/1/20 4:29 PM, Philippe Mathieu-Daudé wrote:
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value. This is not a problem
> for the 32-bit maximum, 4 GiB.
> By using the UINT32_MAX value, the aspeed-ram-container
> MemoryRegion ends up missing 1 byte:
> 
>  $ qemu-system-arm -M ast2600-evb -S -monitor stdio
>  (qemu) info mtree
> 
>   address-space: aspeed.fmc-ast2600-dma-dram
>     0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-container
>       0000000080000000-00000000bfffffff (prio 0, ram): ram
>       00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram
> 
> Fix by using the correct value. We now have:
> 
>   address-space: aspeed.fmc-ast2600-dma-dram
>     0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
>       0000000080000000-00000000bfffffff (prio 0, ram): ram
>       00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/arm/aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 2c23297edf..62344ac6a3 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -262,7 +262,7 @@ static void aspeed_machine_init(MachineState *machine)
>      bmc = g_new0(AspeedBoardState, 1);
>  
>      memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
> -                       UINT32_MAX);
> +                       4 * GiB);
>      memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
>  
>      object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
> 


