Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZB1Jc-0001Aw-Li
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 09:47:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1ZB1JY-00012a-Cp
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 09:47:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1ZB1JX-0008KZ-8S
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 09:47:36 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:38270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>)
	id 1ZB1JS-0008J8-Co; Fri, 03 Jul 2015 09:47:30 -0400
Received: by wibdq8 with SMTP id dq8so100890602wib.1;
	Fri, 03 Jul 2015 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=t1vQZxgKIttFosWeXTv2EjITP38ok5QV14SFGDu7PxA=;
	b=rhYFo9i2kKIHXiL/V6R/x0uQhAaTzlObxpus6ay5abDYFK3Rf6XmwAQOIWVr0upfbO
	P5WGnQLkeN8p5YzIU6UtNe5UKACO0eUmLhYMfaA2tWnAFykxO97bFa785+hF7/gRnVG5
	rwzMzSGLAxGHgfTMaGd6JeKAq2RlfslR1hCr1O7Kk+DYAGhB9Z/asOcp+DnSyhltyhcy
	6P5k1CLm0PKFZvC0epHF64sYzhOGCQpq1J3WfaAeVd+lhuyW9iFwUiStRDBfwkr3gqRm
	Rkqii+WuxiiMQUHMvKwnMj8c4MVlmOjed8szj5Cjl7TwoyOd2J7TSK+5/CP6wFdfKPrC
	fc4g==
X-Received: by 10.180.99.71 with SMTP id eo7mr25340285wib.95.1435931249739;
	Fri, 03 Jul 2015 06:47:29 -0700 (PDT)
Received: from [10.248.117.129] (94-21-30-178.pool.digikabel.hu.
	[94.21.30.178]) by mx.google.com with ESMTPSA id
	xa9sm13447234wjc.43.2015.07.03.06.47.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jul 2015 06:47:28 -0700 (PDT)
From: "=?UTF-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?=
	<DirtY.iCE.hu@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
References: <c7aaec779e13932db2c7dd4cce2700b41f162092.1435923273.git.DirtY.iCE.hu@gmail.com>
	<87616175u3.fsf@blackfin.pond.sub.org>
Message-ID: <5596927F.5000407@gmail.com>
Date: Fri, 3 Jul 2015 15:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <87616175u3.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] opts: produce valid command
 line in qemu_opts_print
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
X-List-Received-Date: Fri, 03 Jul 2015 13:47:37 -0000

2015-07-03 15:01 keltezéssel, Markus Armbruster írta:
> "Kővágó, Zoltán" <dirty.ice.hu@gmail.com> writes:
>
>> This will let us print options in a format that the user would actually
>> write it on the command line (foo=bar,baz=asd,etc=def), without
>> prepending a spurious comma at the beginning of the list, or quoting
>> values unnecessarily.  This patch provides the following changes:
>> * write and id=, if the option has an id
>> * do not print separator before the first element
>> * do not quote string arguments
>> * properly escape commas (,) for QEMU
>>
>> Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
>> ---
>>
>> Changes from patch submitted as part of `qapi flattening':
>> * no longer tries to do proper escaping for the shell
>>
>>   block.c            |  2 +-
>>   util/qemu-option.c | 30 +++++++++++++++++++++++++++---
>>   2 files changed, 28 insertions(+), 4 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 7e130cc..78a5304 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -3813,7 +3813,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
>>       }
>>
>>       if (!quiet) {
>> -        printf("Formatting '%s', fmt=%s", filename, fmt);
>> +        printf("Formatting '%s', fmt=%s ", filename, fmt);
>>           qemu_opts_print(opts, " ");
>>           puts("");
>>       }
>> diff --git a/util/qemu-option.c b/util/qemu-option.c
>> index efe9d27..55ef172 100644
>> --- a/util/qemu-option.c
>> +++ b/util/qemu-option.c
>> @@ -730,14 +730,36 @@ void qemu_opts_del(QemuOpts *opts)
>>       g_free(opts);
>>   }
>>
>> -void qemu_opts_print(QemuOpts *opts, const char *sep)
>> +/* print value, escaping any commas in value */
>> +static void escaped_print(const char *value)
>
> Have you searched the tree for existing code doing this?

I didn't found any function like that.

>> +{
>> +    const char *ptr;
>> +
>> +    for (ptr = value; *ptr; ++ptr) {
>> +        if (*ptr == ',') {
>> +            printf(",,");
>> +        } else {
>> +            putchar(*ptr);
>> +        }
>> +    }
>
> Slightly simpler:
>
>          if (*ptr == ',') {
>              putchar(',');
>          }
>          putchar(*ptr);
>
> Matter of taste.

I also like it better that way. Should I send a v2 patch?

>> +}
>> +
>> +void qemu_opts_print(QemuOpts *opts, const char *separator)
>>   {
>>       QemuOpt *opt;
>>       QemuOptDesc *desc = opts->list->desc;
>> +    const char *sep = "";
>> +
>> +    if (opts->id) {
>> +        printf("id=%s", opts->id); /* passed id_wellformed -> no commas */
>> +        sep = separator;
>> +    }
>>
>>       if (desc[0].name == NULL) {
>>           QTAILQ_FOREACH(opt, &opts->head, next) {
>> -            printf("%s%s=\"%s\"", sep, opt->name, opt->str);
>> +            printf("%s%s=", sep, opt->name);
>> +            escaped_print(opt->str);
>> +            sep = separator;
>>           }
>>           return;
>>       }
>> @@ -750,13 +772,15 @@ void qemu_opts_print(QemuOpts *opts, const char *sep)
>>               continue;
>>           }
>>           if (desc->type == QEMU_OPT_STRING) {
>> -            printf("%s%s='%s'", sep, desc->name, value);
>> +            printf("%s%s=", sep, desc->name);
>> +            escaped_print(value);
>>           } else if ((desc->type == QEMU_OPT_SIZE ||
>>                       desc->type == QEMU_OPT_NUMBER) && opt) {
>>               printf("%s%s=%" PRId64, sep, desc->name, opt->value.uint);
>>           } else {
>>               printf("%s%s=%s", sep, desc->name, value);
>>           }
>> +        sep = separator;
>>       }
>>   }
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>


