Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmcFf-0001BE-IZ
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 05:28:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmcFd-00017F-E9
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 05:28:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmcFa-0007nF-WE
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 05:28:49 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:32905)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gmcFa-0007M4-LL; Thu, 24 Jan 2019 05:28:46 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MTREY-1gcpfY3arU-00TpPn; Thu, 24 Jan 2019 11:28:17 +0100
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, rth@twiddle.net,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20190124073626.20534-1-richardw.yang@linux.intel.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <49187963-3df7-faf6-9d7f-e4568b47cf73@vivier.eu>
Date: Thu, 24 Jan 2019 11:28:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190124073626.20534-1-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:pGuRryP/YxAApuvTOKtdbyl6U5x/4FYD5q0hC30fdvoZJZHGvBt
	YhZdki4Fo8y5k9NBVfpRy/cLcLXuq9iL+n5tsI8grYx3cqAkLieCH3FgmvBQJp1jxHcpDWu
	Z3kYbdm+sM5nasMHDpHvVTOkjrXnVbVbMPaguXYqrctwFxLQLOieFOmRuWdlAZ6n5d2UXxY
	2qeDtEOnMdKerP2jQuEgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mnXZB/f/N8U=:PH1uJ7MmfN/zYTZm+nMCxj
	wq9rAI272xE93EnpR6vEE9kSj4mHp5OLCsfWE5ez9Ajr6sd010wKsDTY7j9S95NLDz/zxDyfv
	qf4fqQ5bIyOOIOulbCrupNvgRa3fUDfh9Ad7hdIObmnk8XyLaHn5TTHtqVra8jc54dI4dEkE6
	o+qKhIDXRAyY7/L8OHPvV/Lfo8ZIYvgpRKW9YkQANlCd9Q0MoxFuASE53/Awp2ePWJj3YNEjq
	rtbPHccDY2l1XwnuzZX2F7IWiz3tFmagznO+PzXXgHt7Auzu2O1Cd1VwOyvKyDHO68U5QQss2
	eT59GseDVWWhZDM6AiqcMK9PJmh4XhHGBZnQrxNGUkGMLhS7JqExOw6fHp6emcu4JsWtReO0Q
	01V0KZRzm/q1TxvcIYgFgrLpUbQy0It/7g/fyFinf8oQP28bkg9wfZrLzlCd5gatkO6z2h7F9
	nR/eWxheZpmu4+2NCN0ym5+AGyzOsuUuZW+5ram/57M0FXF/QKgxoc3+zsVAwdCgMwwN5/Y2A
	83nZ4DGKKg+9DvzrsvwiNvzH52yMr26rs2u4OU0wDbaM07qyOBmjD4Hw2UNYf9dkz3+3IKcu+
	K6MnISV/BYYP+RJgv1CXMWAOMi3Y7f02s/P/ds6uWk9GF/8SQjdRrxzf81U22tNj1Smw9/YQk
	IrZXGYJbcCdJSQlmM9eezymzPDHJ1cC70z7DrY56b/tHJGZ1hB3CYSVBHImhquiAl6y2pu6pw
	LMv0r1YrSSV4YltKJcjuHRDYiLdKLUp6mw4fvo84nos+Rt3WLyeUsRal2As=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/i386/pc.c: fix one typo
 in function name
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
X-List-Received-Date: Thu, 24 Jan 2019 10:28:50 -0000

On 24/01/2019 08:36, Wei Yang wrote:
> Rename pc_get_hotpug_handler to pc_get_hotplug_handler.
> 
> No functional change.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  hw/i386/pc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 115bc2825c..5317e08f60 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -2059,7 +2059,7 @@ static void pc_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
>      }
>  }
>  
> -static HotplugHandler *pc_get_hotpug_handler(MachineState *machine,
> +static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>                                               DeviceState *dev)
>  {
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
> @@ -2389,7 +2389,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      pcmc->save_tsc_khz = true;
>      pcmc->linuxboot_dma_enabled = true;
>      assert(!mc->get_hotplug_handler);
> -    mc->get_hotplug_handler = pc_get_hotpug_handler;
> +    mc->get_hotplug_handler = pc_get_hotplug_handler;
>      mc->cpu_index_to_instance_props = pc_cpu_index_to_props;
>      mc->get_default_cpu_node_id = pc_get_default_cpu_node_id;
>      mc->possible_cpu_arch_ids = pc_possible_cpu_arch_ids;
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

