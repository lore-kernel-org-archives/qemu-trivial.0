Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6sQk-0000o2-VX
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2020 03:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6sQh-0000eC-Fr
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 03:52:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6sQg-0002lz-CK
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 03:52:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29481
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6sQg-0002l0-5w
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 03:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582707148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1xNCtymxtj6oq1AZIuwVUL0tbu7yr3DTKwTvuS6YDg=;
 b=B4N4Xe/vteSqsWxZhCqJMIfAmRhEAYvFnU5j/kbpsnXuNXMbK1rHHUyYNn53av+Vd8p2aH
 nT9VOAxRSf08j+2hX2QH3fg1IxLOxAnelwCwXSEAXY8bvqEWri3GgMuoRThY+qSRxXTMKh
 O44qzxztYR8yuUC/91wI1RpfUy9S4s4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-Xmo8HmUrOzS8Z1pkw-leYQ-1; Wed, 26 Feb 2020 03:52:27 -0500
X-MC-Unique: Xmo8HmUrOzS8Z1pkw-leYQ-1
Received: by mail-wr1-f71.google.com with SMTP id t14so1160652wrs.12
 for <qemu-trivial@nongnu.org>; Wed, 26 Feb 2020 00:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+n9w1MLBMJGohIcxOdLeECKJqC7Wx8SbYRANQglwFl0=;
 b=FmgfH9hev8e8F6LwvgKsCnWQ5LXofVW1Fstn//S8ounj9gbFtCDfz7DSAcnoXhs1xL
 ju9VQNq1WWLaSEv5n7EB6dZV5knPlAQLRAgizDPpr1+B6OC/CDAV31iKeZJGFb8t69SN
 F/XqRzZw3Ry+tqRcLGGGWSXKtW8EScfaaFTBGhigUCwXOQDyhnm68VG7zC1by+C3x6Na
 hd+LZL/Nt0Zo/6NmaXQKWP37SKzW5p533XPAVtxJu+ZHtsRZbZNWPCsAKHH++hr8PzN3
 oCAHXZ94UJEkHzA0j6nv/3oi/WUTGHvdfZMWS9dNimSy1CbwT1vJgl3R7hFuskAyN6lS
 Jb4Q==
X-Gm-Message-State: APjAAAVR39W5mxBQ3LwLDG5TvD6fjeKRt1FMNIMKgncU6u60xe5qTuxj
 YldUauFpDHCMrO1zxJEPMEKDG+2L5a6CPaxzlZ0911TwcO+Susy0Jhx0ecx7LqQFbiVIELnToyK
 KDd4YS3ZNsnuTHwBP6w==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr4329917wru.398.1582707146113; 
 Wed, 26 Feb 2020 00:52:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRBojHao0j2iVhjOC5b2oSR+bHRRgtH0gUVwYC9Qt9n4b4NKP8OV3FYhlqKo5aHh71JeHNSg==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr4329893wru.398.1582707145857; 
 Wed, 26 Feb 2020 00:52:25 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id f1sm2303350wro.85.2020.02.26.00.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 00:52:25 -0800 (PST)
Subject: Re: [PATCH v2 13/13] monitor/hmp-cmds: Remove redundant statement in
 hmp_rocker_of_dpa_groups()
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Euler Robot <euler.robot@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
 <20200226084647.20636-14-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8452ca98-a729-77c2-d79e-dcf0018f1836@redhat.com>
Date: Wed, 26 Feb 2020 09:52:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226084647.20636-14-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Wed, 26 Feb 2020 08:52:32 -0000

On 2/26/20 9:46 AM, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> Clang static code analyzer show warning:
> monitor/hmp-cmds.c:2867:17: warning: Value stored to 'set' is never read
>                  set =3D true;
>                  ^     ~~~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> v1->v2: move the 'set' declaration to the for() statement(Base on Philipp=
e's suggestion).
> ---
>   monitor/hmp-cmds.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 53bc3f76c4..c6b0495822 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2808,7 +2808,6 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const Q=
Dict *qdict)
>       const char *name =3D qdict_get_str(qdict, "name");
>       uint8_t type =3D qdict_get_try_int(qdict, "type", 9);
>       Error *err =3D NULL;
> -    bool set =3D false;
>  =20
>       list =3D qmp_query_rocker_of_dpa_groups(name, type !=3D 9, type, &e=
rr);
>       if (err !=3D NULL) {
> @@ -2820,6 +2819,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const Q=
Dict *qdict)
>  =20
>       for (g =3D list; g; g =3D g->next) {
>           RockerOfDpaGroup *group =3D g->value;
> +        bool set =3D false;
>  =20
>           monitor_printf(mon, "0x%08x", group->id);
>  =20
> @@ -2864,14 +2864,11 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const=
 QDict *qdict)
>  =20
>           if (group->has_set_eth_dst) {
>               if (!set) {
> -                set =3D true;
>                   monitor_printf(mon, " set");
>               }
>               monitor_printf(mon, " dst %s", group->set_eth_dst);
>           }
>  =20
> -        set =3D false;
> -
>           if (group->has_ttl_check && group->ttl_check) {
>               monitor_printf(mon, " check TTL");
>           }
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


