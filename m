Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZHLM-0003xI-L2
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 10:31:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gZHLJ-0003vO-EW
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 10:31:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gZHLG-00084w-2M
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 10:31:33 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gZHLF-000846-QA
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 10:31:29 -0500
Received: by mail-wm1-f66.google.com with SMTP id f81so3221608wmd.4
	for <qemu-trivial@nongnu.org>; Tue, 18 Dec 2018 07:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8yrFPF0b52gazOru3PPuk8cVsjVmPtd9IJYmxT0d3Wk=;
	b=ruXlisGSCLE9NHGZdr783W6wBQrlwil4b2HjAWBu8FwdLkKwP48gW+U+9uhPERrr9s
	o5ciWaTwCw4fD/ejAR4JEHiXdd2G5r9G8uHtRWT+MB4qxICGwc/VPTaiVimfeOZq3chn
	Z6B+Wzr596nGxeuGaJbmwYH5W0zD2OdOeq+E7n/RbSiEpZdTySW9rZvu8MaC08USwrkG
	ziZTBB96yh/rVqx11Y1b19t3eheDSFoGjfdTPqQ+g4CxJj9zo+UU+v7tWe1x9ga27uXC
	5SHWIT41LE4pdpHxRSSik8LXgLAeGO6UJyyp4CKTNxqbYbMWoluIbWZW0tBeQaZVzujj
	bxyQ==
X-Gm-Message-State: AA+aEWbA6XBFL7WS7v2Urh4ujEhA2h6MijBY16L93jQ25zE4+y7lIEmF
	7LEV6KlgdHTISNZcDjsCBbKgKg==
X-Google-Smtp-Source: AFSGD/VwhEm9Z9zGne2V4NuPksdBbvl2NCuUlqoUdJIrrsux2YopbDRIAvm567xfXJtYNid8zuNhOA==
X-Received: by 2002:a1c:2787:: with SMTP id n129mr3780306wmn.128.1545147088456;
	Tue, 18 Dec 2018 07:31:28 -0800 (PST)
Received: from [192.168.1.35] (156.red-88-21-102.staticip.rima-tde.net.
	[88.21.102.156]) by smtp.gmail.com with ESMTPSA id
	l197sm6323826wma.44.2018.12.18.07.31.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 07:31:27 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Markus Armbruster <armbru@redhat.com>, 
	Helge Deller <deller@gmx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
References: <20181218115615.1499-1-philmd@redhat.com>
	<20181218115615.1499-11-philmd@redhat.com>
	<20f62f62-f677-6d0f-09dc-3759cc813d8f@redhat.com>
	<20181218152239.GB19442@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <94e8bd71-302e-bced-665d-78538ea3aba3@redhat.com>
Date: Tue, 18 Dec 2018 16:31:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181218152239.GB19442@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [PATCH v2 10/12] MAINTAINERS: Orphanize the 'CPU
 (QOM)' subsystem
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
X-List-Received-Date: Tue, 18 Dec 2018 15:31:35 -0000

Hi Paolo, Eduardo,

On 12/18/18 4:22 PM, Eduardo Habkost wrote:
> On Tue, Dec 18, 2018 at 01:34:52PM +0100, Paolo Bonzini wrote:
>> On 18/12/18 12:56, Philippe Mathieu-Daudé wrote:
>>> Nobody is looking at those files, downgrade this subsystem as orphan.
>>>
>>> Remove the qemu-devel@nongnu.org entry because the list is always
>>> selected by the 'All patches CC here' section.
>>>
>>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  MAINTAINERS | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index e50f8c6b97..e6a73820f1 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1745,8 +1745,7 @@ S: Supported
>>>  F: scripts/coverity-model.c
>>>  
>>>  CPU
>>> -L: qemu-devel@nongnu.org
>>> -S: Supported
>>> +S: Orphan
>>>  F: qom/cpu.c
>>>  F: include/qom/cpu.h
>>>  
>>>
>>
>> I don't think that's accurate.  Simply there's not much going on.  If
>> patches are sent, get-maintainers's git fallback will do something
>> (probably sending the patch to Eduardo, Igor or me).

I followed Markus suggestion from
https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg05414.html:

  If we take the definition of S: in MAINTAINERS seriously,
  we need to appoint a maintainer (a person, not a mailing list),
  or downgrade to S: Orphan.

> 
> Should we add our names to that section, or is it OK to leave it
> as "S: Supported" even if it doesn't have any official
> maintainers?

