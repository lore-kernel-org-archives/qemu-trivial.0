Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h2dOu-0002cD-JG
	for mharc-qemu-trivial@gnu.org; Sat, 09 Mar 2019 09:56:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2dOs-0002Zz-87
	for qemu-trivial@nongnu.org; Sat, 09 Mar 2019 09:56:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2dOr-0007VX-HS
	for qemu-trivial@nongnu.org; Sat, 09 Mar 2019 09:56:34 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34313)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h2dOp-0007TV-NA; Sat, 09 Mar 2019 09:56:31 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1N3sVq-1gtf7q0N6G-00zrOI; Sat, 09 Mar 2019 15:54:42 +0100
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<philmd@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-3-philmd@redhat.com>
	<e95c7422-c52e-2105-e314-ea19778f8d8c@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <18d16b8e-01b3-2bc1-be98-67329e4437cc@vivier.eu>
Date: Sat, 9 Mar 2019 15:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e95c7422-c52e-2105-e314-ea19778f8d8c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AocXO5cwl2osY83SL5ct4rgP2PVwxIDnNtux2AfRcTNi4gHoGH3
	xMz9xhyM5Rq0Y80kz/NhRc2YnIphSOfYqf+BUIbTHN6LsrdfgkRG6hSVL7tJKFeftb2YqKg
	AOcOkwFkOrtt7fWdeBFoBGT11rH7Bpd/FCCLQVrAmt7lR3zh+Anol26HcuKWSx8ihCGc8Vy
	aPnyfr14WmnqLehwhKS/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x5lvhef1GgI=:yN6ojwAK8jSAlsngH7i/Oa
	rOmMO59TMYYrV+CcRyQDUdBo05clZeRcP67b1h3ksLL3uen4zNITDIXxLZTHMrUW5gf92OjXW
	h7EWuECWWLRGbjkFFxT+0pZAY3DT4UtEVhQ1w+wG+oeuvmDMZXLk1KeVue/NI1AWohVNNy0rb
	pwcPqsGf/S+hpO7TioEOQihQWxleF7xb/zhDEtdEJMfWKik846gNV0IM+RtK+Nfv/xHTgFMHM
	NEPkqgGsBF1JfO4Lb7Vtc2xMKzfUiibWBzvIt5s4GEQR+L6g+rG/x4sVHCdxZzeh/9qHhHMNQ
	Xt9807bg2EJczUrS6nddzKbNn+MivQUjOpsV19woUVEficu942Zw1TmKGMcrKI0cm6r1uO6gn
	qPfzS9uLTqOalOt0B4D47+Q5AUMQUZc8z5tJGIX7sY0RGk88fgFl7ndwRZzE37gkAgG+2z0EP
	QQdQ9mkM/VHzC0kPe8se6ZGMP0S3Qdc21HA36CchmUpBOOACi7zZ3rCdOtBI8P/N/PecpacOA
	hZ2loxDJnbbANqKk69OTOm/HLbbfMzgki3/A/CsY8zSLtvUC15zOL2Js8LOpUX7JdynPbZ3F7
	GX2FH7vdbcaMtCIlG6Yc+DfFSUh8XsJqPAB9daCoEwdi8hjjMDuT6e/vQPzaQlO1FPwBaLe2P
	epk1QUlyc+Pbu2ZutCJm1p+KBEm94AHgCI1yuED7k+VD/cgFUMZQFWCaPXUqjGn23kWpIR7se
	DHlTjsbil79Phjf8cm801zw0WmmuQV6JFY7bUz3v6ZBe9asmfFDKDvrIYPQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH v2 02/18] hw/i386: Remove
 unused include
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
X-List-Received-Date: Sat, 09 Mar 2019 14:56:35 -0000

On 08/03/2019 12:32, Thomas Huth wrote:
> On 08/03/2019 02.32, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v2: Drop files that do use fw_cfg (Michael):
>> - hw/i386/acpi-build.c
>> - hw/i386/pc.c
>> ---
>>  hw/acpi/piix4.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>> index 8fd25a5926..7b98121070 100644
>> --- a/hw/acpi/piix4.c
>> +++ b/hw/acpi/piix4.c
>> @@ -28,7 +28,6 @@
>>  #include "sysemu/sysemu.h"
>>  #include "qapi/error.h"
>>  #include "qemu/range.h"
>> -#include "hw/nvram/fw_cfg.h"
>>  #include "exec/address-spaces.h"
>>  #include "hw/acpi/piix4.h"
>>  #include "hw/acpi/pcihp.h"
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

