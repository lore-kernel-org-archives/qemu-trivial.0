Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCjSX-000468-Rn
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2017 04:49:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eCjSW-00045I-2K
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 04:49:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eCjSV-0004bX-34
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 04:49:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eCjSP-0004Ys-Km; Thu, 09 Nov 2017 04:49:09 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65A785F7B8;
	Thu,  9 Nov 2017 09:49:08 +0000 (UTC)
Received: from [10.36.117.221] (ovpn-117-221.ams2.redhat.com [10.36.117.221])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CAB718A83;
	Thu,  9 Nov 2017 09:48:58 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>, 
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
References: <20171108032052.20029-1-f4bug@amsat.org>
	<20171109063931.GE13786@lemon>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d0048bf1-671a-fad5-0931-4c52fea484e3@redhat.com>
Date: Thu, 9 Nov 2017 10:48:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171109063931.GE13786@lemon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 09 Nov 2017 09:49:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: simpler/faster
 "make help"
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
X-List-Received-Date: Thu, 09 Nov 2017 09:49:17 -0000

On 09/11/2017 07:40, Fam Zheng wrote:
> On Wed, 11/08 00:20, Philippe Mathieu-Daud=C3=A9 wrote:
>> Using obscure black magic introduced in eaa2ddbb767 :)
>=20
> That is a pretty boring one compared to the rest of our build system.
>=20
>>
>> In an out-of-tree directory, running "../configure && make help" will =
generate
>> some required files (.mak), then clone some submodules, compile at lea=
st
>> the capstone submodule, generate QMP and Trace files, and finally disp=
lay
>> the help.
>>
>> On an outdated computer (Sun Blade workstation), running "make help" t=
ook
>> more than 5h :) With this patch it took roughly 37min.
>>
>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>
>> before:
>>
>> $ make help
>>   GEN     config-host.h
>>   CC      cs.o
>>   CC      utils.o
>>   CC      SStream.o
>>   CC      MCInstrDesc.o
>>   CC      MCRegisterInfo.o
>>   CC      arch/ARM/ARMDisassembler.o
>>   CC      arch/ARM/ARMInstPrinter.o
>>   CC      arch/ARM/ARMMapping.o
>>   CC      arch/ARM/ARMModule.o
>>   CC      arch/AArch64/AArch64BaseInfo.o
>>   CC      arch/AArch64/AArch64Disassembler.o
>>   CC      arch/AArch64/AArch64InstPrinter.o
>>   CC      arch/AArch64/AArch64Mapping.o
>>   CC      arch/AArch64/AArch64Module.o
>>   CC      arch/Mips/MipsDisassembler.o
>>   CC      arch/Mips/MipsInstPrinter.o
>>   CC      arch/Mips/MipsMapping.o
>>   CC      arch/Mips/MipsModule.o
>>   CC      arch/PowerPC/PPCDisassembler.o
>>   CC      arch/PowerPC/PPCInstPrinter.o
>>   CC      arch/PowerPC/PPCMapping.o
>>   CC      arch/PowerPC/PPCModule.o
>>   CC      arch/Sparc/SparcDisassembler.o
>>   CC      arch/Sparc/SparcInstPrinter.o
>>   CC      arch/Sparc/SparcMapping.o
>>   CC      arch/Sparc/SparcModule.o
>>   CC      arch/SystemZ/SystemZDisassembler.o
>>   CC      arch/SystemZ/SystemZInstPrinter.o
>>   CC      arch/SystemZ/SystemZMapping.o
>>   CC      arch/SystemZ/SystemZModule.o
>>   CC      arch/SystemZ/SystemZMCTargetDesc.o
>>   CC      arch/X86/X86DisassemblerDecoder.o
>>   CC      arch/X86/X86Disassembler.o
>>   CC      arch/X86/X86IntelInstPrinter.o
>>   CC      arch/X86/X86ATTInstPrinter.o
>>   CC      arch/X86/X86Mapping.o
>>   CC      arch/X86/X86Module.o
>>   CC      arch/XCore/XCoreDisassembler.o
>>   CC      arch/XCore/XCoreInstPrinter.o
>>   CC      arch/XCore/XCoreMapping.o
>>   CC      arch/XCore/XCoreModule.o
>>   CC      MCInst.o
>>   AR      libcapstone.a
>> ar: creating capstone/libcapstone.a
>>   GEN     trace/generated-tcg-tracers.h
>>   GEN     trace/generated-helpers-wrappers.h
>>   GEN     trace/generated-helpers.h
>>   GEN     trace/generated-helpers.c
>>   GEN     module_block.h
>> make[1]: 'capstone/libcapstone.a' is up to date.
>> Generic targets:
>>   all             - Build all
>>   dir/file.o      - Build specified target only
>>   install         - Install QEMU, documentation and tools
>>   ctags/TAGS      - Generate tags file for editors
>>   cscope          - Generate cscope index
>> [...]
>>
>> after:
>>
>> $ make help
>> Generic targets:
>>   all             - Build all
>>   dir/file.o      - Build specified target only
>>   install         - Install QEMU, documentation and tools
>>   ctags/TAGS      - Generate tags file for editors
>>   cscope          - Generate cscope index
>> [...]
>>
>>  Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 0496c5057a..7850ca5928 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -6,7 +6,7 @@ BUILD_DIR=3D$(CURDIR)
>>  # Before including a proper config-host.mak, assume we are in the sou=
rce tree
>>  SRC_PATH=3D.
>> =20
>> -UNCHECKED_GOALS :=3D %clean TAGS cscope ctags docker docker-%
>> +UNCHECKED_GOALS :=3D %clean TAGS cscope ctags docker docker-% help
>> =20
>>  # All following code might depend on configuration variables
>>  ifneq ($(wildcard config-host.mak),)
>> --=20
>> 2.15.0
>>
>>
>=20
> I think there are more targets that can be added to this list (vm-test =
for one)
> but this is already an improvement:
>=20
> Reviewed-by: Fam Zheng <famz@redhat.com>
>=20
> So who is the maintainer to merge this patch?

I can do it.

Paolo

