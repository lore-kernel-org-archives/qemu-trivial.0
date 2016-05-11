Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0PNs-0001Zu-FX
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2016 04:20:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1b0PNo-0001T7-Sg
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 04:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1b0PNm-0004KO-6B
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 04:20:39 -0400
Received: from [59.151.112.132] (port=2263 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1b0PNd-00047i-P7; Wed, 11 May 2016 04:20:32 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6434513"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 May 2016 16:20:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D5AE242B66F8;
	Wed, 11 May 2016 16:19:58 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 11 May 2016 16:19:58 +0800
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
References: <1460879154-13258-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5731D9A7.4030300@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, <armbru@redhat.com>,
	<peter.maydell@linaro.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5732EC2B.8030005@cn.fujitsu.com>
Date: Wed, 11 May 2016 16:24:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <5731D9A7.4030300@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: D5AE242B66F8.AC749
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH v2] qdev: Clean up around properties
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
X-List-Received-Date: Wed, 11 May 2016 08:20:42 -0000

For mjt`s information: it has been

Reviewed-by: Markus Armbruster <armbru@redhat.com>

On 05/10/2016 08:52 PM, Paolo Bonzini wrote:
> Just comments, so
>
> Cc: qemu-trivial@nongnu.org
>
> On 17/04/2016 09:45, Cao jin wrote:
>> include:
>> 1. remove unnecessary declaration of static function
>> 2. fix inconsistency between comment and function name, and typo OOM->QOM
>> 2. update comments of functions, use uniform format(GTK-Doc style)
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>> changelog:
>> 1. Use uniform comment format. (Markus)
>> 2. Update function comments. (Markus & Paolo)
>>
>> comments of qdev_add_legacy_property maybe need polishing, Maintainer who will
>> take this patch can touch that comment directly:)
>>
>>   hw/core/qdev.c               | 30 +++++++++++++++++++-----------
>>   include/hw/qdev-properties.h | 10 ++++++++--
>>   2 files changed, 27 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>> index db41aa1..204f77b 100644
>> --- a/hw/core/qdev.c
>> +++ b/hw/core/qdev.c
>> @@ -58,9 +58,6 @@ const char *qdev_fw_name(DeviceState *dev)
>>       return object_get_typename(OBJECT(dev));
>>   }
>>
>> -static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
>> -                                     Error **errp);
>> -
>>   static void bus_remove_child(BusState *bus, DeviceState *child)
>>   {
>>       BusChild *kid;
>> @@ -908,13 +905,20 @@ static void qdev_get_legacy_property(Object *obj, Visitor *v,
>>   }
>>
>>   /**
>> - * @qdev_add_legacy_property - adds a legacy property
>> + * qdev_property_add_legacy:
>> + * @dev: Device to add the property to.
>> + * @prop: The qdev property definition.
>> + * @errp: location to store error information.
>> + *
>> + * Add a legacy QOM property to @dev for qdev property @prop.
>> + * On error, store error in @errp.
>>    *
>> - * Do not use this is new code!  Properties added through this interface will
>> - * be given names and types in the "legacy" namespace.
>> + * Legacy properties are string versions of QOM properties.  The format of
>> + * the string depends on the property type.  Legacy properties are only
>> + * needed for "info qtree".
>>    *
>> - * Legacy properties are string versions of other OOM properties.  The format
>> - * of the string depends on the property type.
>> + * Do not use this is new code!  QOM Properties added through this interface
>> + * will be given names in the "legacy" namespace.
>>    */
>>   static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
>>                                        Error **errp)
>> @@ -937,10 +941,14 @@ static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
>>   }
>>
>>   /**
>> - * @qdev_property_add_static - add a @Property to a device.
>> + * qdev_property_add_static:
>> + * @dev: Device to add the property to.
>> + * @prop: The qdev property definition.
>> + * @errp: location to store error information.
>>    *
>> - * Static properties access data in a struct.  The actual type of the
>> - * property and the field depends on the property type.
>> + * Add a static QOM property to @dev for qdev property @prop.
>> + * On error, store error in @errp.  Static properties access data in a struct.
>> + * The type of the QOM property is derived from prop->info.
>>    */
>>   void qdev_property_add_static(DeviceState *dev, Property *prop,
>>                                 Error **errp)
>> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
>> index 0586cac..034b75a 100644
>> --- a/include/hw/qdev-properties.h
>> +++ b/include/hw/qdev-properties.h
>> @@ -197,8 +197,14 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *dev,
>>                                       Property *prop, const char *value);
>>
>>   /**
>> - * @qdev_property_add_static - add a @Property to a device referencing a
>> - * field in a struct.
>> + * qdev_property_add_static:
>> + * @dev: Device to add the property to.
>> + * @prop: The qdev property definition.
>> + * @errp: location to store error information.
>> + *
>> + * Add a static QOM property to @dev for qdev property @prop.
>> + * On error, store error in @errp.  Static properties access data in a struct.
>> + * The type of the QOM property is derived from prop->info.
>>    */
>>   void qdev_property_add_static(DeviceState *dev, Property *prop, Error **errp);
>>
>>
>
>
> .
>

-- 
Yours Sincerely,

Cao jin



