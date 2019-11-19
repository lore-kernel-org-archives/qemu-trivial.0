Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iX3ki-0003X5-DD
	for mharc-qemu-trivial@gnu.org; Tue, 19 Nov 2019 08:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iX3kg-0003T9-6G
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 08:41:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iX3ke-00085b-So
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 08:41:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44456
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iX3ke-00084K-Os
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2019 08:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574170861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvLEma868VerfcY9cGL/XZHbyX6+aMoYXkvfMFpv2HA=;
 b=QtGNgbBGNfxImVQDoZLS3oyLUCCfC/jP7GOcuzKcrnh2fOvDaZgtd4pplvlJZEB4mQyiGe
 Qasud+plDbYsZhshMlTVYWvqoC0LmDWlEagxMJCGV4CH1Zmmx4RRpO5hZsgmPxt+gL94Nc
 VhnYm3xSNVb6e6vGmRtjWB0Op8NPvT4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-KD11LyXOM9Wjl8bLbxMxnQ-1; Tue, 19 Nov 2019 08:41:00 -0500
Received: by mail-wr1-f72.google.com with SMTP id w4so18296039wro.10
 for <qemu-trivial@nongnu.org>; Tue, 19 Nov 2019 05:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=caSvQYXVu5p8CaLM5JD5sNI7gfZU9ArDc9kdEyBZJFo=;
 b=Z2LDphw/AZ0p1mMGQ2lsE5o7VDih0nXtOIi7KXabknmJddhM5S1eL907kYM//ozsT5
 QtXcarXu05arLa3byhTKWxYdP3h4189Gz1MCmIBom/XEp4hSkOc0rNabAxIMH+yAv9be
 RtqTdhd/zG/ekEfmdOEfaXIUVwC0ynGdJLZdUGzFUf7aVWHrR6FGyc4hg2dRrCsAZ6U9
 EmCR2wEtajnohOzwGJHqugNQB4bUogvu+cZxHuxtck9WKwmndjvZJCTSn5dMOzDm6VW5
 UsCZbBVWZER7t9fpEW4xgY7eLWIHCHlJrduhD7di/ClGqywUg50anaVXOJ71QTDu+pfa
 ampg==
X-Gm-Message-State: APjAAAUWQrwoxoxyM/Gmudr4gz2X0p6YV/RN3M8qoYNnkHR4sCprj4JQ
 mK+6g0aglr7t7ehtajIumyC8USOR38yHNNBmU3JZ9i4so3jxEwCDEtEdeXV0/Z+w1Ha6vHtjghj
 9957wxO8G2On5den2yw==
X-Received: by 2002:a5d:4142:: with SMTP id c2mr10102718wrq.60.1574170859296; 
 Tue, 19 Nov 2019 05:40:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXbxF8Szt+fFPoBeKoGCW5nMpyrJ/yJhyiGso0sfxuG0PmRNjMm4NW1NSUN2Q/6Kd/jjYugg==
X-Received: by 2002:a5d:4142:: with SMTP id c2mr10102700wrq.60.1574170859128; 
 Tue, 19 Nov 2019 05:40:59 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id w19sm3089247wmk.36.2019.11.19.05.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 05:40:58 -0800 (PST)
Subject: Re: [PATCH] monitor: Remove unused define
To: Yury Kotov <yury-kotov@yandex-team.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20191119110709.13827-1-yury-kotov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1368c05d-a7ba-4a62-8325-8d49d33f6e84@redhat.com>
Date: Tue, 19 Nov 2019 14:40:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119110709.13827-1-yury-kotov@yandex-team.ru>
Content-Language: en-US
X-MC-Unique: KD11LyXOM9Wjl8bLbxMxnQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2019 13:41:07 -0000

On 11/19/19 12:07 PM, Yury Kotov wrote:
> Remove the definition of QMP_ACCEPT_UNKNOWNS as it is unused since
> refactoring 5c678ee8d940
>=20
> Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
> ---
>   monitor/misc.c | 3 ---
>   1 file changed, 3 deletions(-)
>=20
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3baa15f3bf..6680734ea1 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -106,9 +106,6 @@ struct MonFdset {
>       QLIST_ENTRY(MonFdset) next;
>   };
>  =20
> -/* QMP checker flags */
> -#define QMP_ACCEPT_UNKNOWNS 1
> -
>   /* Protects mon_fdsets */
>   static QemuMutex mon_fdsets_lock;
>   static QLIST_HEAD(, MonFdset) mon_fdsets;
>=20

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>


