Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBy6L-0004Gj-L3
	for mharc-qemu-trivial@gnu.org; Wed, 11 Mar 2020 05:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1jBy6J-0004GV-68
 for qemu-trivial@nongnu.org; Wed, 11 Mar 2020 05:56:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1jBy6I-0002Iz-6o
 for qemu-trivial@nongnu.org; Wed, 11 Mar 2020 05:56:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29549
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1jBy6I-0002Hn-2Y
 for qemu-trivial@nongnu.org; Wed, 11 Mar 2020 05:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583920589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0+asA5DTHEAtkwKXEAUoVcm7EKaHU50stltHUcW1qg=;
 b=IZYsTeriVzEdR+Z/DkawqLpU+1ODIK7ORkrkPDGOk0cqjOXEUOl8VmgAYVpIn5HIfvIgOE
 hGePS/nfw7T/HwZE3Scy6Oo6d8vvSt9DoNeS71AycxA+W8Yd0mUUwsps9nY5uHuzXMOIzP
 REOCNnk6jZEvudHUG0l8iaKNnBJQtyI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-bbHX28nvOw69K76KKXFSoA-1; Wed, 11 Mar 2020 05:56:27 -0400
X-MC-Unique: bbHX28nvOw69K76KKXFSoA-1
Received: by mail-wm1-f71.google.com with SMTP id z14so449500wmc.7
 for <qemu-trivial@nongnu.org>; Wed, 11 Mar 2020 02:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LF9pqJIb06girj2Cmul2tQCYIuIsqdoetjtfYvVouOo=;
 b=ckg0IOJWUUHwlWmblH/V3SPo9ybCbqg5bt/lSHwx1V70AfjxTS0Ll5hEU6QtHQYGDH
 dZy9EhizUbNtEYjBbzacXsCYrY/KGG1lwzguaJsltUI1X5IuPFFLckfLweAE4n9esR67
 s5xXqb9OJz18SMuG3AyKq1T8rgH6w0rQSElIKFbizVEVUhKSNy70wdBaRfg3pTTSGpas
 DE5AK2iIjCtF9wsh0b+HOr26JpXjJXpHXJ3KbJqlROoxHhARbwwa10mj8v7yhMzQ0pmY
 NhDTzPWycmIpiKcRSEchz0JEWoM1Vly7QdR1Kj84Y+hvvIVnoUhwOyuPyEf7Twe3MUFP
 oCNw==
X-Gm-Message-State: ANhLgQ0yvT51FEN9NyWuhkI51XB6pPA+BGiCMnjUN6YnxxnK8y142hqQ
 sLbAfLV6JgaG6vkfYc97tFlGjLJfoiIHm8KwWJy5W8DFvOllVicX1iYMSs8wDARAqwvRu9hRkHx
 yCwnYTFdYxGkDRe57cA==
X-Received: by 2002:adf:f2ca:: with SMTP id d10mr3725701wrp.247.1583920586619; 
 Wed, 11 Mar 2020 02:56:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvLS6jfCl4dGnrZiuYjKWkc4Wsp65Ie/UyhGADVO+FmcMmjKMv96LHbBcKKFShfoP1tvVCk0g==
X-Received: by 2002:adf:f2ca:: with SMTP id d10mr3725682wrp.247.1583920586418; 
 Wed, 11 Mar 2020 02:56:26 -0700 (PDT)
Received: from steredhat (host32-201-dynamic.27-79-r.retail.telecomitalia.it.
 [79.27.201.32])
 by smtp.gmail.com with ESMTPSA id k12sm10340633wrv.88.2020.03.11.02.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 02:56:25 -0700 (PDT)
Date: Wed, 11 Mar 2020 10:56:23 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, imammedo@redhat.com,
 mst@redhat.com
Subject: Re: [PATCH 0/2] hw/mem/pc-dimm: Trivial code changes
Message-ID: <20200311095623.g32nabv45ws23uah@steredhat>
References: <20200310180510.19489-1-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200310180510.19489-1-wainersm@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
X-List-Received-Date: Wed, 11 Mar 2020 09:56:32 -0000

On Tue, Mar 10, 2020 at 03:05:08PM -0300, Wainer dos Santos Moschetta wrote=
:
> Improve one error message and fix one code style warning.
>=20
> Wainer dos Santos Moschetta (2):
>   hw/mem/pc-dimm: Print slot number on error at pc_dimm_pre_plug()
>   hw/mem/pc-dimm: Fix line over 80 characters warning
>=20
>  hw/mem/pc-dimm.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


