Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X6fUv-0005Sk-4Y
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jul 2014 08:36:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1X6fUp-0005QY-2D
	for qemu-trivial@nongnu.org; Mon, 14 Jul 2014 08:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1X6fUf-0008HH-NI
	for qemu-trivial@nongnu.org; Mon, 14 Jul 2014 08:36:43 -0400
Received: from mail-vc0-f172.google.com ([209.85.220.172]:36378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1X6fUf-0008H7-JV
	for qemu-trivial@nongnu.org; Mon, 14 Jul 2014 08:36:33 -0400
Received: by mail-vc0-f172.google.com with SMTP id hq11so5890422vcb.17
	for <qemu-trivial@nongnu.org>; Mon, 14 Jul 2014 05:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=HaGqVR7bVBa4+voQpssBgf2iU4Uxcj8v/Pdaqe7VqfE=;
	b=XISAarVYSHNC4klJZuX5P8VRmBzquGtf1fkW26W8diHRjLmtqgwkrFZf0iDLp0w0CC
	QwLFKDerpcUth0lG6t3mMIKE6ANgxRbRQlZTGB5Ix8kEJe+SPVagP2pFjRfPGIf8BhMa
	6nsoXcs4t0ofIVfz6MYDcKaXCbKxTvmenROxscITTEiIQTxRDbthudbLvZW7THdrR9o5
	F8Yaloy/3+TeyHbnbBb4btNwfpuHL/j7W+dcK7+K2WarTyEiMbPrmVHjysWiJ85eAdDT
	EosDU+ufWYE6Z4sGp4KUL/N55HSUGwrJczSaO9755ivrqzaqxrC1GUh4PyA2Gg0aHvp1
	usnQ==
X-Gm-Message-State: ALoCoQm4VRWXK5MQQugS/6dtVIIblhqzExjkrAbpUOnbpV042q3EErTiKtITbILonnwU1Sxgc5XP
MIME-Version: 1.0
X-Received: by 10.220.182.5 with SMTP id ca5mr137026vcb.50.1405341392784; Mon,
	14 Jul 2014 05:36:32 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.176.137 with HTTP; Mon, 14 Jul 2014 05:36:32 -0700 (PDT)
In-Reply-To: <877g442kie.fsf@blackfin.pond.sub.org>
References: <1403720497-5318-1-git-send-email-pbonzini@redhat.com>
	<877g442kie.fsf@blackfin.pond.sub.org>
Date: Mon, 14 Jul 2014 22:36:32 +1000
X-Google-Sender-Auth: 2KFqgKGwEuUUs1rXkF8fzGbWNZM
Message-ID: <CAEgOgz77aLSt_vww3LwhT5-kUaJhDnmgdDVVdBfQXQvm-DzSUg@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
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
X-List-Received-Date: Mon, 14 Jul 2014 12:36:48 -0000

On Thu, Jun 26, 2014 at 5:32 PM, Markus Armbruster <armbru@redhat.com> wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>> Otherwise, hot-unplug of pci-serial-2x trips the assertion
>> in memory_region_destroy:
>>
>>     (qemu) device_del gg
>>     (qemu) qemu-system-x86_64: /work/armbru/tmp/qemu/memory.c:1021: memory_region_destroy: Assertion `((&mr->subregions)->tqh_first == ((void *)0))' failed.
>>     Aborted (core dumped)
>>
>> Reported-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> Would it make sense to add a "must not contain subregions" to
> memory_region_destroy()'s function comment?
>

Any reason to just not patch the memory region finaliser to unparent
all contained subregions automatically rather than assert? Destroying
a container should imply removing the subregion relationship and
simply orphan the subregion.

Regards,
Peter

