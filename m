Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aotn2-0007wp-Tq
	for mharc-qemu-trivial@gnu.org; Sat, 09 Apr 2016 10:23:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aotmz-0007rj-UI
	for qemu-trivial@nongnu.org; Sat, 09 Apr 2016 10:23:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aotmz-0005Kz-0R
	for qemu-trivial@nongnu.org; Sat, 09 Apr 2016 10:23:05 -0400
Received: from [59.151.112.132] (port=38305 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aotmr-0005Gd-Kc; Sat, 09 Apr 2016 10:22:59 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5433023"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Apr 2016 22:22:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 801D2408D262;
	Sat,  9 Apr 2016 22:22:31 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sat, 9 Apr 2016 22:22:31 +0800
To: Markus Armbruster <armbru@redhat.com>
References: <1458814461-5387-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<87mvp4xsbk.fsf@dusky.pond.sub.org>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <pbonzini@redhat.com>, 
	<peter.maydell@linaro.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <570910D5.4030705@cn.fujitsu.com>
Date: Sat, 9 Apr 2016 22:25:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87mvp4xsbk.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 801D2408D262.A24F9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev property: cleanup
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
X-List-Received-Date: Sat, 09 Apr 2016 14:23:07 -0000



On 04/08/2016 07:17 PM, Markus Armbruster wrote:

>> - * Static properties access data in a struct.  The actual type of the
>> - * property and the field depends on the property type.
>> + * Static properties access data in a struct. The actual type of ObjectProperty
>> + * and the struct field depends on the @qtype type.
>>    */
>
> Not sure this part is an improvement.  What's wrong with the current text?
>

In a word: little hard for newbies like me to understand. (I think 
comments are for newbies). see my feeling about the comment:

As per my understanding, property has 2 kinds, former qdev property and 
the latest QOM property. For me, the original description is too 
ambiguous about 'property'.

original: *The actual type of the property and the field depends on the 
property type*

Using two same word 'property' is ambiguous and hard for newbie to 
distinguish. The 1st 'property' should mean a QOM property. and the 2nd 
'property', I think the original author`s meaning is: qdev property. 
But, what is the qdev property *type*? cannot find 'type' field in the 
definition except a *qtype*

struct Property {
     const char   *name;
     PropertyInfo *info;
     ptrdiff_t    offset;
     uint8_t      bitnr;
     QType        qtype;
     int64_t      defval;
     int          arrayoffset;
     PropertyInfo *arrayinfo;
     int          arrayfieldsize;
};

And *the actual type of the field* depends on the qtype, take bitmap 
field for example, bitmap field in a structure is always a *int*, but 
when convert to QOM property, it is treated as a *bool*, see 
DEFINE_PROP_BIT, DEFINE_PROP_BIT64, its qtype are QTYPE_QBOOL.

But I am little confused also now, I think my modification isn`t perfect
1. see how qdev_property_add_static invoke object_property_add, it pass 
prop->info->name as its QOM property type

2. when structure field is enum, QOM property will treat it as 
string(not depends on qtype now), see code:

else if (prop->info->enum_table) {
     object_property_set_str(obj, prop->info->enum_table[prop->defval],
                             prop->name, &error_abort);

I will do more analyse before v2.

-- 
Yours Sincerely,

Cao jin



