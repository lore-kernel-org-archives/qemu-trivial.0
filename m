Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iViG3-0003Nt-Pv
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2019 15:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iViG1-0003L8-Sx
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 15:31:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iViFz-0006U4-5k
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 15:31:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34215
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iViFz-0006Rl-2S
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 15:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573849908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wk6s1160OiyFDrJru6mpBK7L5AOMjUJCoVN/rHRzToA=;
 b=R9nfQksn/pbcTv67Wwloty7K6ny7USWusOEK9lKN+n0A+3ExhJ6KsoDHVI9K/AconKPZc/
 8TD6NSoeYKf9jMug9h9nbmjU9ghYgU5Xhbe88C1VPv3J7Z23of1BLU66S7ZsLRm+6MJSIM
 usStUNHYa0KHpHh4vaqlu9rG6RE8UwI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-Ui7VfnWzPtmeHEEMO2URrg-1; Fri, 15 Nov 2019 15:31:47 -0500
Received: by mail-wr1-f72.google.com with SMTP id y3so8660111wrm.12
 for <qemu-trivial@nongnu.org>; Fri, 15 Nov 2019 12:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1dyQYbeuhA9Jvw72v9+LcpMKRql2FGVU0jczaHzpTwM=;
 b=JrGYpGRTo2/y89PqNjPbrw4Y7bmmTYGY370mTEplIWxAMO2y5PW3ldOxDUXYoTN/a6
 MoTgPP9s7vPyulN287qMV2HkZ9AHvcola0Ey39hEwnclp5/TEHYXfKT/jpgX8ZoKgYuA
 N918P4CifLdO1exItO74YSIc+wGUmG5k2y6+Bnpaa7HFH9SDYD2JbQ4t46ngQlG+9/Ee
 N31EUyNkaN2ihbF4GvrcQGUSxtMV17yk6StQmQkka7mbqDVO/qwFBaFlsmrb1a3Wy/h3
 Cw5OaA8qHJZrobtG1lmg9uVbkOlEXZJc9Ojefcz/zNufgcib1sfYEHG9JvSZO6daKKac
 R7kQ==
X-Gm-Message-State: APjAAAX8q5NG9hsFWInWu55JFg/4jllVI1K/znVv9tW9ZsIlrWZlhaSC
 rLRYE1Ea6ubpsdrwBunNl8igKKsEpyoAqyU0DTwVkunSxD3f92bcAs74zVkpiVEbSfYNNii3q1o
 V6EKFwawuCgB6BK2WMw==
X-Received: by 2002:adf:f504:: with SMTP id q4mr2907977wro.160.1573849905938; 
 Fri, 15 Nov 2019 12:31:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRrHwDeIY0Klkj4Zrdu2c9gZskMdYJyXIJ8XLMXfEiHITrwadbf/sXjMeJWqn7adjfN3yD6g==
X-Received: by 2002:adf:f504:: with SMTP id q4mr2907923wro.160.1573849905459; 
 Fri, 15 Nov 2019 12:31:45 -0800 (PST)
Received: from [192.168.1.35] (170.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.170])
 by smtp.gmail.com with ESMTPSA id w12sm10808553wmi.17.2019.11.15.12.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2019 12:31:44 -0800 (PST)
Subject: Re: [PATCH for-4.2] hw/i386: Fix compiler warning when CONFIG_IDE_ISA
 is disabled
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20191115145049.26868-1-thuth@redhat.com>
 <CAFEAcA-EuQVBtr=BCE5sdHo+LMv8XchHUSPM=CgSYxPVryWKZg@mail.gmail.com>
 <273a3123-9eef-c78e-5b83-833a21e3988c@redhat.com>
 <CAFEAcA9N+T=M=5-xb3ahRMqD6oxhm5Lx55-1Mtk1vXsRJEomwA@mail.gmail.com>
 <85b5fbcc-e06b-7ce2-0a97-7fdc156915cd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <21520139-af31-6ca7-c505-9252ca2bacde@redhat.com>
Date: Fri, 15 Nov 2019 21:31:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <85b5fbcc-e06b-7ce2-0a97-7fdc156915cd@redhat.com>
Content-Language: en-US
X-MC-Unique: Ui7VfnWzPtmeHEEMO2URrg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 15 Nov 2019 20:31:55 -0000

On 11/15/19 5:12 PM, Thomas Huth wrote:
> On 15/11/2019 17.15, Peter Maydell wrote:
>> On Fri, 15 Nov 2019 at 16:08, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 15/11/2019 16.54, Peter Maydell wrote:
>>>> On Fri, 15 Nov 2019 at 15:10, Thomas Huth <thuth@redhat.com> wrote:
>>>>> --- a/hw/i386/pc_piix.c
>>>>> +++ b/hw/i386/pc_piix.c
>>>>> @@ -78,7 +78,6 @@ static void pc_init1(MachineState *machine,
>>>>>       X86MachineState *x86ms =3D X86_MACHINE(machine);
>>>>>       MemoryRegion *system_memory =3D get_system_memory();
>>>>>       MemoryRegion *system_io =3D get_system_io();
>>>>> -    int i;
>>>>>       PCIBus *pci_bus;
>>>>>       ISABus *isa_bus;
>>>>>       PCII440FXState *i440fx_state;
>>>>> @@ -253,7 +252,7 @@ static void pc_init1(MachineState *machine,
>>>>>       }
>>>>>   #ifdef CONFIG_IDE_ISA
>>>>>   else {
>>>>> -        for(i =3D 0; i < MAX_IDE_BUS; i++) {
>>>>> +        for (int i =3D 0; i < MAX_IDE_BUS; i++) {
>>>>>               ISADevice *dev;
>>>>>               char busname[] =3D "ide.0";
>>>>>               dev =3D isa_ide_init(isa_bus, ide_iobase[i], ide_iobase=
2[i],
>>>>
>>>> Don't put variable declarations inside 'for' statements,
>>>> please. They should go at the start of a {} block.
>>>
>>> Why? We're using -std=3Dgnu99 now, so this should not be an issue anymo=
re.
>>
>> Consistency with the rest of the code base, which mostly
>> avoids this particular trick.
>=20
> We've also got a few spots that use it...
> (run e.g.: grep -r 'for (int ' hw/* )

~31 (vs 8000+):

$ git grep -E 'for\s*\((int|size_t)'|egrep -v '\.(cc|cpp):'
audio/audio_legacy.c:400:        for (int i =3D 0; audio_prio_list[i]; i++)=
 {
hw/block/pflash_cfi02.c:281:    for (int i =3D 0; i <=20
pflash_regions_count(pfl); ++i) {
hw/block/pflash_cfi02.c:889:    for (int i =3D 0; i < nb_regions; ++i) {
hw/i386/fw_cfg.c:39:    for (size_t i =3D 0; i <=20
ARRAY_SIZE(fw_cfg_arch_wellknown_keys); i++) {
hw/i386/pc.c:1478:    for (size_t i =3D 0; i < ISA_NUM_IRQS; i++) {
hw/isa/lpc_ich9.c:70:    for (intx =3D 0; intx < PCI_NUM_PINS; intx++) {
hw/isa/lpc_ich9.c:126:        for (intx =3D 0; intx < PCI_NUM_PINS; intx++)=
 {
hw/microblaze/xlnx-zynqmp-pmu.c:71:    for (int i =3D 0; i <=20
XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
hw/microblaze/xlnx-zynqmp-pmu.c:124:    for (int i =3D 0; i <=20
XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
hw/mips/cisco_c3600.c:472:    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
hw/mips/mips_malta.c:1471:    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
hw/ppc/fw_cfg.c:39:    for (size_t i =3D 0; i <=20
ARRAY_SIZE(fw_cfg_arch_wellknown_keys); i++) {
hw/riscv/sifive_e.c:187:    for (int i =3D 0; i < 32; i++) {
hw/riscv/sifive_gpio.c:32:    for (int i =3D 0; i < SIFIVE_GPIO_PINS; i++) =
{
hw/riscv/sifive_gpio.c:360:    for (int i =3D 0; i < SIFIVE_GPIO_PINS; i++)=
 {
hw/sd/aspeed_sdhci.c:130:    for (int i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS;=
=20
++i) {
hw/sparc/sun4m.c:117:    for (size_t i =3D 0; i <=20
ARRAY_SIZE(fw_cfg_arch_wellknown_keys); i++) {
hw/sparc64/sun4u.c:108:    for (size_t i =3D 0; i <=20
ARRAY_SIZE(fw_cfg_arch_wellknown_keys); i++) {
hw/usb/hcd-xhci.c:3553:    for (intr =3D 0; intr < xhci->numintrs; intr++) =
{
hw/virtio/vhost.c:454:        for (int i =3D 0; i < n_old_sections; i++) {
qemu-nbd.c:302:            for (size_t bit =3D 0; bit <=20
ARRAY_SIZE(flag_names); bit++) {
target/i386/hvf/hvf.c:497:    for (int i =3D 0; i < 8; i++) {
target/i386/hvf/x86_decode.c:34:    for (int i =3D 0; i <=20
decode->opcode_len; i++) {
tests/pflash-cfi02-test.c:343:    for (int region =3D 0; region <=20
nb_erase_regions; ++region) {
tests/pflash-cfi02-test.c:407:    for (int region =3D 0; region <=20
nb_erase_regions; ++region) {
tests/pflash-cfi02-test.c:447:    for (int region =3D 0; region <=20
nb_erase_regions; ++region) {
tests/pflash-cfi02-test.c:448:        for (int i =3D 0; i <=20
config->nb_blocs[region]; ++i) {
tests/pflash-cfi02-test.c:458:    for (int region =3D 0; region <=20
nb_erase_regions; ++region) {
tests/pflash-cfi02-test.c:469:    for (int region =3D 0; region <=20
nb_erase_regions; ++region) {
tests/pflash-cfi02-test.c:470:        for (int i =3D 0; i <=20
config->nb_blocs[region]; ++i) {
tests/pflash-cfi02-test.c:658:    for (size_t i =3D 0; i <=20
nb_configurations; ++i) {

[I introduced most of them without respecting the CODING_STYLE,
  but checkpatch didn't complained].

>> See the 'Declarations' section of CODING_STYLE.rst.
>=20
> OK, that's a point. But since this gnu99 is a rather new option that we
> just introduced less than a year ago, we should maybe think of whether
> we want to allow this for for-loops now, too (since IMHO it's quite a
> nice feature in gnu99).

I agree with Thomas. I started to clean some signed/unsigned warnings=20
and various cases the scope of some variables is confuse.

The related question is, is it OK to use size_t to iterate over an array?

   for (size_t i =3D 0; i < ARRAY_SIZE(array); i++) {
     ...
   }

Asking in this thread so we can modify CODING_STYLE accordingly :)


