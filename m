Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gSiO0-0002ME-1A
	for mharc-qemu-trivial@gnu.org; Fri, 30 Nov 2018 07:59:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gSiNw-0002Kj-04
	for qemu-trivial@nongnu.org; Fri, 30 Nov 2018 07:59:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gSiNs-0002BZ-ED
	for qemu-trivial@nongnu.org; Fri, 30 Nov 2018 07:59:07 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:44529)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gSiNs-00029v-4i; Fri, 30 Nov 2018 07:59:04 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MNLVU-1grWf21Qvi-00Om37; Fri, 30 Nov 2018 13:58:58 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Li Qiang <liq3ea@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1543571638-2892-1-git-send-email-liq3ea@gmail.com>
	<16fc13de-778b-430e-d734-bbc802d25ba8@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <8f24cfdf-061b-75e8-9d89-e2b0b5196115@vivier.eu>
Date: Fri, 30 Nov 2018 13:58:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <16fc13de-778b-430e-d734-bbc802d25ba8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:l8CGMIv9nKj4K4asWZ8um0mbCowavAPdwPZ7WGbTy54/PrR9vVX
	sv94SYULBH1x+Xni21laKyJUssFs9piJ/EjrLbD7VGsfLUcHI9vZaUTffj3ltY+fUmbVmdl
	Ua0uHTyqKUgPJg5FinvSR0jWVxASab83vmSflesBPKtBMMRwDdW4yiw8jA3/y8Ii4CggiHM
	aUqd152zcMYpPBJGfTVyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LOr5A8ddiQw=:EFn7+yBoMfe/x/QbVw86Le
	Yq6ZB78dc99Byddxh1tiJvxdICIoI7Qj+sSP0mwgCvDVU7XiGeUsgU3sJ9ORsvt0pa1s97D0/
	tba+Zq4xmk+ZDbpYYvZ2v3iL5MXxCbld2irOY54fgfqPQqQJLPrNV3tzqd6mo/JEA0srKXkSk
	k6l9GoSeBXb9WcRyBMKAiRiX3bTgPHzdVulGSxQ1L126BjTv035WxPj/ybcLUmyknVrWIVM27
	EVyb2YqkyYt7UtmEBw/Q00g/KkeHtYLS387bArpWaPu38BVIvhfQpLY9rbGRd9NYJ4tcCmBAV
	uMbp3qEV6VPCmh2FX51gxhcwOmicrQiloSotQjeMnhVLTO2oaDhxiJg019OKnub3qoXMFk9s2
	ZGChU4LQ8phbp6tivAKQsWrd/DMhH660kKwoYNaSxB5vwj8lx5yxP+/p9gI6wejIA9eiqnfPm
	gJSbysr5xjd8oDMiVc26YH4WXyBqUZp9PjlAQ1ZjltvYho/ht0pd6xbx4N5tMZ128Bon8Ho/+
	hY1+tRsAvRwoHTSF+Sz4YQTFMm07dE51ZpB2NVtogOSU+CgrWdR8zdyEgaSWa74lZSY8Z2ZtH
	MzZj25uengZJ5rZPXA0I2rW/kmuvGSYcklRBHhjX+Kftvt+Q4BJNOU3SkM87Kyez09E3lP8un
	Ypm5/iME1umzMRo9/IDPzS+n9Mi2UQPmDnCsUBmtNW+nnn8HnGWMSfRZRCnk3LNXD+pFsVFAl
	rQTCQHH4J5H4lKkKPtpse76KQodH+FFa3ya+zf1DtLKsvrFNkidr+L4fvSA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [PATCH] util: vfio-helpers: use ARRAY_SIZE in
 qemu_vfio_init_pci()
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
X-List-Received-Date: Fri, 30 Nov 2018 12:59:11 -0000

On 30/11/2018 13:01, Philippe Mathieu-Daudé wrote:
> On 30/11/18 10:53, Li Qiang wrote:
>> Cc: qemu-trivial@nongnu.org
>>
>> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>> ---
>>  util/vfio-helpers.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
>> index cccc9cd42e..342d4a2285 100644
>> --- a/util/vfio-helpers.c
>> +++ b/util/vfio-helpers.c
>> @@ -348,7 +348,7 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
>>          goto fail;
>>      }
>>  
>> -    for (i = 0; i < 6; i++) {
>> +    for (i = 0; i < ARRAY_SIZE(s->bar_region_info); i++) {
>>          ret = qemu_vfio_pci_init_bar(s, i, errp);
>>          if (ret) {
>>              goto fail;
>>

I'm wondering if adding a #define to define the size of the array and
then using it with the for() loop wouldn't be better?

Laurent

