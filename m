Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtqLk-0007VU-Uc
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 03:57:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtqLi-0007TN-7U
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 03:56:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtqLh-0002Rx-82
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 03:56:58 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44518)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtqLg-0002KD-Vl
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 03:56:57 -0500
Received: by mail-wr1-f67.google.com with SMTP id v16so1498635wrn.11
	for <qemu-trivial@nongnu.org>; Wed, 13 Feb 2019 00:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Kb7Ot4HfrgUUTulkKErKuDtbyG5m03Bgqxi9VF4fjqM=;
	b=XJIqmgnu9DdeXqIgdm+TN28cJRdoJ5526/e/wYKOQw/CXK8VaoglBCATdmVhsWwhvA
	yN3INfEuLz2ud1DhiZuImbYD8HMK6cw5Eb5bsKL5z1fVy68YJQjEZnlEK4SHori7Ezvn
	TBZBlYjmcVwQ2rurHjvgaQiNbSvB0yTQu04IWCN2ngwQ5tY1edmTBkImvAmZN+xZTXTp
	KwFzIAYFJKOTkr96f6mzI3cUOk1LsCsxKpDt4Pa/KSRvDBcbZ43GqY55gszlNPcpjR4k
	zWQUZNCN9679wPY7TagXju4aPY/dI+No/oafBkzEGn7qm/EYDo+K1kYMUD4/b0K5PW9Z
	RdiA==
X-Gm-Message-State: AHQUAuYOd/1eCJZ0R//3hF9tm9H2ncZIKMDH+XMlhIzmrjXr/iSMLlLb
	9athmi0tQQ7Ombtqh8jaXe1rWA==
X-Google-Smtp-Source: AHgI3IYZd4W+zh55A5tPERyHMS6CWLyrbx+fCxNaaIrngDY4GG9S8/nK24QlQt4sLG4cUIeQQh1CpQ==
X-Received: by 2002:adf:f805:: with SMTP id s5mr6145765wrp.234.1550048199860; 
	Wed, 13 Feb 2019 00:56:39 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10])
	by smtp.gmail.com with ESMTPSA id j5sm1005998wrw.59.2019.02.13.00.56.38
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 00:56:39 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin"
	<mst@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, imammedo@redhat.com
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190212052224.GA4839@richard>
	<20190212003414-mutt-send-email-mst@kernel.org>
	<4d6f639b-fe11-7048-3975-ee1c1875b8d3@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3d700eed-5637-b05a-63c2-9f73a465bcb5@redhat.com>
Date: Wed, 13 Feb 2019 09:56:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <4d6f639b-fe11-7048-3975-ee1c1875b8d3@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 13 Feb 2019 08:56:59 -0000

Hi Laurent,

On 2/13/19 9:49 AM, Laurent Vivier wrote:
> On 12/02/2019 06:34, Michael S. Tsirkin wrote:
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
> 
> Or I can take the series through the trivial branch and update manually
> Philippe's lastname?

I appreciate the help with manual update, however Wei is not the only
one having this problem (other developpers has non-ASCII in their name,
and use such tags).
I'd rather prefer we find a proper configuration setup to help the
community.

Another (fair) approach is to forbid non-ASCII chars in all part of patches.

Regards,

Phil.

