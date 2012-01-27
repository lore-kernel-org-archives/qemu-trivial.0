Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqkpP-0001EM-6J
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 07:22:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RqkpJ-0000uQ-Tw
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 07:22:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RqkpF-0003Hs-U7
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 07:22:45 -0500
Received: from thoth.sbs.de ([192.35.17.2]:24630)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1RqkpA-0003H4-HX; Fri, 27 Jan 2012 07:22:36 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id q0RCMVqL029805;
	Fri, 27 Jan 2012 13:22:31 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q0RCMSn5015964;
	Fri, 27 Jan 2012 13:22:28 +0100
Message-ID: <4F229704.9020003@siemens.com>
Date: Fri, 27 Jan 2012 13:22:28 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: "quintela@redhat.com" <quintela@redhat.com>
References: <1327593288-22521-1-git-send-email-afaerber@suse.de>
	<8739b1pceg.fsf@elfo.elfo>
In-Reply-To: <8739b1pceg.fsf@elfo.elfo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.2
Cc: Kevin Wolf <kwolf@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	=?UTF-8?B?QW5kcmVhcw==?= =?UTF-8?B?IEbDpHJiZXI=?=
	<andreas.faerber@web.de>, Amit Shah <amit.shah@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH v8] qdev: Add support for property type
	bool
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
X-List-Received-Date: Fri, 27 Jan 2012 12:22:49 -0000

On 2012-01-27 13:17, Juan Quintela wrote:
>> +{
>> +    bool *ptr = qdev_get_prop_ptr(dev, prop);
>> +    if (strcmp(str, "true") == 0 || strcmp(str, "yes") == 0) {
>> +        *ptr = true;
>> +    } else if (strcmp(str, "false") == 0 || strcmp(str, "no") == 0) {
>> +        *ptr = false;
>> +    } else {
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int parse_bool_switch(DeviceState *dev, Property *prop,
>> +                             const char *str)
>> +{
>> +    bool *ptr = qdev_get_prop_ptr(dev, prop);
>> +    if (strcmp(str, "on") == 0) {
>> +        *ptr = true;
>> +    } else if (strcmp(str, "off") == 0) {
>> +        *ptr = false;
>> +    } else {
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
> 
> As I am joining late to this discussion, I am not going to point it very
> strong.  But I think that it is an easy to have a single bool type that
> accept yes/on/true and no/off/false.  Didn't really see a strong
> advantage with the split.

Accepting all this on input is a non-issue, but true/false as output is
suboptimal for quite a few existing and future switches.

Jan

-- 
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

