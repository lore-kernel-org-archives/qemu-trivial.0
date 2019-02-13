Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtoJX-0000kB-HZ
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 01:46:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtoJU-0000eW-Lp
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 01:46:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gto5s-0007Ea-VF
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 01:32:30 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gto5r-0007DK-BQ
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 01:32:28 -0500
Received: by mail-wr1-f67.google.com with SMTP id l9so1069018wrt.13
	for <qemu-trivial@nongnu.org>; Tue, 12 Feb 2019 22:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nwLG84HgzepjBCCjqXM+594Q8nFx9hiAsxV2F7g4LD0=;
	b=RN7800I1czDkOh/3h8QMM3eUsTs/UC/SaTXVSLsUwbrUuwFgOZJEZ9+2qJjIKhUO3V
	Zd8Hb6ojez2T2G8FaeoJDTPOmNmEi3v6L6dOh2YLThro3EwV2AO56EeQ1GxwBNX8Zq6+
	W4VCFEUXBvuV/5O49VDNIwqCu8nmQmfdkcHfac+o9xVv0p6YnHZg99+fdOXNjHSIQ2+2
	SNUWhtPoKMosXUesMdkiyIxOQ11Lgxka6WMOwDppu256RWVVGCTy+LjXrIy7I0xqyGOr
	RWqdbjgOQ4rFna6IqahATsRap3qxAsCsV+A+Ef66BUALPPcWwwasdp3tvCAHmho8OLI6
	SVYQ==
X-Gm-Message-State: AHQUAuZzKt9q1/rnUIAiYFv70sA/BI5zFtWlC5GF8tyZJKGaGqm1aRzw
	vRFrUtrCzZRDIGvHElxRpWyMyQ==
X-Google-Smtp-Source: AHgI3Ib6VbGuFar+4MgERhsj4K98BJx9J45bLbCNbbxIibI/8hCl0tnf5kDH5/rSUlCcwNeabq/xeg==
X-Received: by 2002:adf:e8c7:: with SMTP id k7mr5797372wrn.298.1550039546093; 
	Tue, 12 Feb 2019 22:32:26 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10])
	by smtp.gmail.com with ESMTPSA id s5sm5200412wmh.37.2019.02.12.22.32.24
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 22:32:24 -0800 (PST)
To: Wei Yang <richardw.yang@linux.intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu,
	imammedo@redhat.com
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190212052224.GA4839@richard>
	<20190212003414-mutt-send-email-mst@kernel.org>
	<20190213062638.GA8835@richard>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <49b44562-8d21-29de-f979-0b491fc7dc99@redhat.com>
Date: Wed, 13 Feb 2019 07:32:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190213062638.GA8835@richard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [PATCH v3 0/3] Trivial cleanup in hw/acpi
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
X-List-Received-Date: Wed, 13 Feb 2019 06:46:33 -0000

Hi Wei,

On 2/13/19 7:26 AM, Wei Yang wrote:
> On Tue, Feb 12, 2019 at 12:34:31AM -0500, Michael S. Tsirkin wrote:
>> On Tue, Feb 12, 2019 at 01:22:24PM +0800, Wei Yang wrote:
>>> On Wed, Jan 30, 2019 at 08:06:50AM +0800, Wei Yang wrote:
>>>> There are several functions/variable which are not used anymore.
>>>>
>>>> This serials just remove those without functional change.
>>>>
>>>> v3: add ack and repost in a new thread
>>>> v2: change commit log from "is now used in no place" to "in not used anymore"
>>>
>>> Michael,
>>>
>>> Looks this serials is not merged yet.
>>>
>>> Is there any problem I need to fix?
>>
>> Yes pls repost with fixed reviewed-by tags.
>>
> 
> I tried to use git-sendemail to send those patches again.
> 
> The character 茅 looks good in patch file, while after git-sendemail this is
> changed.
> 
> My encoding property in mail is :
> 
>     MIME-Version: 1.0
>     Content-Type: text/plain; charset=UTF-8
>     Content-Language: en-US
>     Content-Transfer-Encoding: 8bit

I'm not sure but you can try:

      Content-Transfer-Encoding: base64

> 
> Looks the same as Philippe's.
> 
> Any hint on how to send out a correct character with git-sendemail?

If it doesn't work, then use my ASCII-reduced lastname, I can live with
that:

"Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>"

Thanks for trying,

Phil.

> 
>>
>>>>
>>>> Wei Yang (3):
>>>>  hw/i386/pc.c: remove unused function pc_acpi_init()
>>>>  hw/acpi: remove unused function acpi_table_add_builtin()
>>>>  hw/acpi: remove unnecessary variable acpi_table_builtin
>>>>
>>>> hw/acpi/core.c         | 10 +---------
>>>> hw/i386/pc.c           | 27 ---------------------------
>>>> include/hw/acpi/acpi.h |  1 -
>>>> include/hw/i386/pc.h   |  1 -
>>>> 4 files changed, 1 insertion(+), 38 deletions(-)

