Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRhSF-00057F-7G
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 10:38:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cRhS8-000544-WE
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 10:38:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cRhS4-0001QY-2Q
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 10:38:13 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:35444)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cRhS3-0001Q6-QI; Thu, 12 Jan 2017 10:38:07 -0500
Received: by mail-wm0-x244.google.com with SMTP id l2so4543181wml.2;
	Thu, 12 Jan 2017 07:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=GCCKhWQwrlg2zNRUG745DNe4ZZsgmS9d8V9i+iI9kzY=;
	b=a43l0gUeQpgNCybCXbWHDj2abrFz2I77pnoDp5J/IWWt85Lz7TJFUpVI1fMpgYAXbr
	PlaIhRDbGLKNdaiEK6IOBtr3wlvyN0EvJNH6SwOMAPpLNbxHsjpHJEr1gsMUTgHxezXc
	TOQDk4Rqh/H6y6hg/O4oXerv0oUtuzz4f50AOYcjp86a4WSgoKUq0pHykmf1heMzI6aa
	lhJWv2IEVN+zIh95Fq7s5nKd4MMxEPuMVszYY7QjRjPiBaEQnjnHInuqVM0mZNULw3EB
	cO3lz76fyuMIKF6H9JvaTj+PzCbntfRlC233ljHVh+Y8eNeXI0k9eMHuUUYDPm8FDZ9k
	95xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=GCCKhWQwrlg2zNRUG745DNe4ZZsgmS9d8V9i+iI9kzY=;
	b=MfJyaPLxd3MWQO5P2eDF+lXeSHiYGKqUxJ3aooFc5Yqn77hHivUqdBxXeUZF9quH3M
	2wDiRg55tR4hojFyZn7/9/JSQwCzrgBqdcL6dwcC/DW/phVNwddbTjhrqcnOhQJPFmuu
	AVlEsZBl+YBUM4IutZwnXZ4kfw4HeghyfQw0/GCkh8MKyVymTPaT9Nv1sN2ZxwfreqL1
	LnU2xbxmyRHkh31X7uMyNOx68TAlvdjyQoaX7M87k1GjUD2gMTtaDoM0dDUDoWLt3VgL
	fXBqWWt4DcGQdFlI8uSH8EuSE/LIo3RBl3bGjZ1+YtlQxGpvdCh8uSmxXICBXPtEBpO2
	riSg==
X-Gm-Message-State: AIkVDXJLZoBXFo1ftdn5fgHzwGTkNdfEzlFP+UP+XiGooO0voXVAaCYJf3F4CUVdFZMv8A==
X-Received: by 10.28.144.135 with SMTP id s129mr8301162wmd.18.1484235486272;
	Thu, 12 Jan 2017 07:38:06 -0800 (PST)
Received: from [192.168.10.165] (94-39-158-71.adsl-ull.clienti.tiscali.it.
	[94.39.158.71]) by smtp.googlemail.com with ESMTPSA id
	d29sm3736483wmi.19.2017.01.12.07.38.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 07:38:05 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20161212173151.18092-1-marcandre.lureau@redhat.com>
	<20161212173151.18092-3-marcandre.lureau@redhat.com>
	<1f3b7ccb-19fd-c3df-0a67-fc554c55e05a@msgid.tls.msk.ru>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c67425f0-5bc0-f07c-6936-522fcef3b445@redhat.com>
Date: Thu, 12 Jan 2017 16:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1f3b7ccb-19fd-c3df-0a67-fc554c55e05a@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [PATCH 3/3] object: make some funcs static
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
X-List-Received-Date: Thu, 12 Jan 2017 15:38:18 -0000



On 12/01/2017 11:48, Michael Tokarev wrote:
> 12.12.2016 20:31, Marc-André Lureau wrote:
>> There is no need to have those functions as public API.
> 
> Were "some" being object_initialize_with_type() and
> object_new_with_type().
> 
> I'm applying this to -trivial, and Cc'ing Andreas, maybe
> he will say more.

The idea here was to allow caching the type and speed up things.  But I
guess that QOM objects are very heavyweight, and thus we won't have for
example SCSIRequest as a QOM object.

Paolo

> Thanks,
> 
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>  qom/object.c         |  4 ++--
>>  include/qom/object.h | 24 ------------------------
>>  2 files changed, 2 insertions(+), 26 deletions(-)
>>
>> diff --git a/qom/object.c b/qom/object.c
>> index 7a05e35ed9..eb3d0f64e4 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -351,7 +351,7 @@ static void object_post_init_with_type(Object *obj, TypeImpl *ti)
>>      }
>>  }
>>  
>> -void object_initialize_with_type(void *data, size_t size, TypeImpl *type)
>> +static void object_initialize_with_type(void *data, size_t size, TypeImpl *type)
>>  {
>>      Object *obj = data;
>>  
>> @@ -467,7 +467,7 @@ static void object_finalize(void *data)
>>      }
>>  }
>>  
>> -Object *object_new_with_type(Type type)
>> +static Object *object_new_with_type(Type type)
>>  {
>>      Object *obj;
>>  
>> diff --git a/include/qom/object.h b/include/qom/object.h
>> index c5456db05d..e9791a210e 100644
>> --- a/include/qom/object.h
>> +++ b/include/qom/object.h
>> @@ -586,18 +586,6 @@ struct InterfaceClass
>>   */
>>  Object *object_new(const char *typename);
>>  
>> -/**
>> - * object_new_with_type:
>> - * @type: The type of the object to instantiate.
>> - *
>> - * This function will initialize a new object using heap allocated memory.
>> - * The returned object has a reference count of 1, and will be freed when
>> - * the last reference is dropped.
>> - *
>> - * Returns: The newly allocated and instantiated object.
>> - */
>> -Object *object_new_with_type(Type type);
>> -
>>  /**
>>   * object_new_with_props:
>>   * @typename:  The name of the type of the object to instantiate.
>> @@ -726,18 +714,6 @@ int object_set_propv(Object *obj,
>>                       Error **errp,
>>                       va_list vargs);
>>  
>> -/**
>> - * object_initialize_with_type:
>> - * @data: A pointer to the memory to be used for the object.
>> - * @size: The maximum size available at @data for the object.
>> - * @type: The type of the object to instantiate.
>> - *
>> - * This function will initialize an object.  The memory for the object should
>> - * have already been allocated.  The returned object has a reference count of 1,
>> - * and will be finalized when the last reference is dropped.
>> - */
>> -void object_initialize_with_type(void *data, size_t size, Type type);
>> -
>>  /**
>>   * object_initialize:
>>   * @obj: A pointer to the memory to be used for the object.
>>
> 
> 
> 

