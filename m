Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X6hEy-000723-Kj
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jul 2014 10:28:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1X6hEq-00071A-J7
	for qemu-trivial@nongnu.org; Mon, 14 Jul 2014 10:28:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1X6hEh-0005FQ-IF
	for qemu-trivial@nongnu.org; Mon, 14 Jul 2014 10:28:20 -0400
Received: from mail-vc0-f179.google.com ([209.85.220.179]:43153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1X6hEh-0005Eo-ER
	for qemu-trivial@nongnu.org; Mon, 14 Jul 2014 10:28:11 -0400
Received: by mail-vc0-f179.google.com with SMTP id id10so7488547vcb.10
	for <qemu-trivial@nongnu.org>; Mon, 14 Jul 2014 07:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0Jg8aSJ0a83+0uHmSWMbttyR1nrOfpM1nmpCpgxCawM=;
	b=C3huDizyywA8HOtrIV6x6p2yofhHvN72qKXHzvYchUNDwKRErs8joKpteukEX9+nkA
	3UxFr/qpPM6TcFsd5CZYHjfK6vFUjX7Te06+LzbhoniPuOen3HNIFOs3VoTY/oXhnI1L
	kOxXPBEaZue3GBD2JtNML+nCLadStluwk03B0yA12D5kYXyaiEiORPk2rXZ01ehatiCQ
	cdh20sTgQIw4t2P7FwrwioQ3mfL67QmDMXWE5G9hpsWpqAiaS/wuQHKlgM6V49cJkZQW
	jDhWDR8YE2NVlJnU1gez4Qas+DfpJla4aH/en/GnnPkWM3uXmHBpOSFnjJwl2K8WNzsZ
	Gpjg==
X-Gm-Message-State: ALoCoQn2x3UB3of39+R2iBBuj2Wc5WULBYHY2IPeIutR/uykXMh50m35YTpwlNuS7IsHn9Ei2nRS
MIME-Version: 1.0
X-Received: by 10.52.239.6 with SMTP id vo6mr492273vdc.59.1405348091011; Mon,
	14 Jul 2014 07:28:11 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.176.137 with HTTP; Mon, 14 Jul 2014 07:28:10 -0700 (PDT)
In-Reply-To: <53C3E71E.6080909@redhat.com>
References: <1403720497-5318-1-git-send-email-pbonzini@redhat.com>
	<877g442kie.fsf@blackfin.pond.sub.org>
	<CAEgOgz77aLSt_vww3LwhT5-kUaJhDnmgdDVVdBfQXQvm-DzSUg@mail.gmail.com>
	<53C3E71E.6080909@redhat.com>
Date: Tue, 15 Jul 2014 00:28:10 +1000
X-Google-Sender-Auth: IQe7_aam9bUxcn6fcpsBVWPG8Go
Message-ID: <CAEgOgz6gdJp+F+dWuMeVzr4QYR9u+wmPb=SE2P2mmdTo7ggXKw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.179
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial-pci: remove memory
 regions from BAR before destroying them
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jul 2014 14:28:26 -0000

On Tue, Jul 15, 2014 at 12:20 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Il 14/07/2014 14:36, Peter Crosthwaite ha scritto:
>
>> On Thu, Jun 26, 2014 at 5:32 PM, Markus Armbruster <armbru@redhat.com>
>> wrote:
>>>
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> Otherwise, hot-unplug of pci-serial-2x trips the assertion
>>>> in memory_region_destroy:
>>>>
>>>>     (qemu) device_del gg
>>>>     (qemu) qemu-system-x86_64: /work/armbru/tmp/qemu/memory.c:1021:
>>>> memory_region_destroy: Assertion `((&mr->subregions)->tqh_first == ((void
>>>> *)0))' failed.
>>>>     Aborted (core dumped)
>>>>
>>>> Reported-by: Markus Armbruster <armbru@redhat.com>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>
>>>
>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>>
>>
>> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>
>>> Would it make sense to add a "must not contain subregions" to
>>> memory_region_destroy()'s function comment?
>>>
>>
>> Any reason to just not patch the memory region finaliser to unparent
>
>
> Note that unparent for memory regions is _not_ memory_region_del_subregion.
> It is memory_region_destroy.
>

Yes, bad choice of words by me. What I was going for was "un-contain" I guess.

Regards,
Peter

> The parent object of a memory region is a device; the _container_ of a
> memory region is another memory region.
>
>
>> all contained subregions automatically rather than assert? Destroying
>> a container should imply removing the subregion relationship and
>> simply orphan the subregion.
>
>
> This makes sense since we will soon make memory_region_destroy optional
> (devices will automatically destroy their memory regions).  Before
> QOMification, however, I think the assert was a useful debugging tool,
> guaranteeing that owners of memory regions were destroyed in the right
> order.  So we could indeed revisit this in 2.2 and make
> memory_region_del_subregion also optional.
>
> Paolo
>

