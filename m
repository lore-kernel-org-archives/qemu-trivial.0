Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxOF-0004Pt-Nm
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:27:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cVxOC-0004MK-TO
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:27:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cVxOC-0005cC-0L
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:27:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41428)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cVxO6-0005bd-JC; Tue, 24 Jan 2017 04:27:38 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD0F1804F1;
	Tue, 24 Jan 2017 09:27:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-93.ams2.redhat.com
	[10.36.117.93])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0O9Rbp7023682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 24 Jan 2017 04:27:38 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CE1A61138645; Tue, 24 Jan 2017 10:27:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
References: <1484927639-3841-1-git-send-email-thuth@redhat.com>
	<0c562336-31a8-5347-1123-810543563fd5@msgid.tls.msk.ru>
	<15b9c04d-23e3-2166-c2e0-7b5a963350c1@redhat.com>
Date: Tue, 24 Jan 2017 10:27:35 +0100
In-Reply-To: <15b9c04d-23e3-2166-c2e0-7b5a963350c1@redhat.com> (Thomas Huth's
	message of "Tue, 24 Jan 2017 08:48:37 +0100")
Message-ID: <87r33su7so.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 24 Jan 2017 09:27:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/isa/isa-bus: Set
 category of the "isabus-bridge" device
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
X-List-Received-Date: Tue, 24 Jan 2017 09:27:45 -0000

Thomas Huth <thuth@redhat.com> writes:

> On 24.01.2017 08:42, Michael Tokarev wrote:
>> 20.01.2017 18:53, Thomas Huth wrote:
>>> It has "bridge" in its name, so it should be in the category
>>> DEVICE_CATEGORY_BRIDGE.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  hw/isa/isa-bus.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
>>> index 9d07b11..0ffbc8d 100644
>>> --- a/hw/isa/isa-bus.c
>>> +++ b/hw/isa/isa-bus.c
>>> @@ -219,6 +219,7 @@ static void isabus_bridge_class_init(ObjectClass *klass, void *data)
>>>  {
>>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>>  
>>> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>>      dc->fw_name = "isa";
>>>  }
>> 
>> Does it have any effect on the guest?
>> ISA is an old thing...
>
> No, as far as I know, this is just used in qdev_print_devinfos() to
> print out the devices in nice categories when you start QEMU with
> "-device ?". Devices that do not have a category bit set show up in the
> "Uncategorized" section - which tends to get overcrowded if the devices
> are not sorted into proper categories.

It's definitely the only effect of dc->categories.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

