Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j53pe-0005ha-R4
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2020 03:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1j53pc-0005gx-07
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 03:38:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1j53pa-000594-Va
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 03:38:43 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47496
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1j53pa-00056M-Ru
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 03:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582274321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBAct6Z9OiV68TaWEqvLLVbwoKPlKy80g5pl+xUlkSE=;
 b=Q6whyGGxPK4GBJsi/6pPAd+/7FE6V4fcbtHTx7K/7878WoiXOOJ6K1kVp3Nk6624d3ubsw
 UVdTKeVbxH8EKSzdavkG7kp1BvZ2Fz9tTMl2kRaiNGiENXySRkxOzFfnWur+4MStcYFnMG
 /fA6vbWcmiMgpJnh/yt6KC/8bf8ERmU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-29GO6mSYPfWmXQaNmcILxg-1; Fri, 21 Feb 2020 03:38:39 -0500
Received: by mail-wm1-f70.google.com with SMTP id t17so317056wmi.7
 for <qemu-trivial@nongnu.org>; Fri, 21 Feb 2020 00:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H9vErtnKYlYy6wFbuRMHoCpDJR+/+RmgsfPlLs55K8I=;
 b=W7jiOXmp9IDOJNT7UFrbLancyxyJn4abiKi0DqslpFtXlI2nyxBbRtv39EEOScz7Yj
 9tQmKBcd1OdIkvylsmT/3C4lI/7gh1Suibq48C+QrqBaQNgAie26t7aFUouZ+ceyTbbq
 84KTWF0+PR46rOg4lYMZnoFI4TTFXv9Fifl4YJh5EWu4lhjThp/4d4mhZ+VHv9pbwYTv
 dvjDQ0XeYmoSGjNMXKuAi/fpaIZSLO1ADOWX6kKvDaWJ+6F0DpypEOJl1yOpuzD05lrX
 UlfBsmzNqcT0ye9gNaNnlSEFV87nm61VSk0oC25H6KnNRhEyKxMvynjgZuSa8VwzBrmc
 2DaA==
X-Gm-Message-State: APjAAAVX5qbiiRnQjqbv4xs6Kmy98+A+phPlPtEV92UucbnSnP9qoC6/
 tVPWfzfy/9t/nw4A5cf5+PbKVk216pp2TU/Osf6XBHLskZljol3/8jguN/yEiH1TjVK5UKY67CU
 tinfF6xQi6XlwZmfUtQ==
X-Received: by 2002:adf:f401:: with SMTP id g1mr46449545wro.129.1582274318634; 
 Fri, 21 Feb 2020 00:38:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFigIyMxkF6U99YhEsl22THDxvi64Ti9uHBBPsqvCKlRnEC/kh00SSqjEAjxmiHPh1N/qE+Q==
X-Received: by 2002:adf:f401:: with SMTP id g1mr46449519wro.129.1582274318340; 
 Fri, 21 Feb 2020 00:38:38 -0800 (PST)
Received: from steredhat (host209-4-dynamic.27-79-r.retail.telecomitalia.it.
 [79.27.4.209])
 by smtp.gmail.com with ESMTPSA id q14sm3144766wrj.81.2020.02.21.00.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 00:38:37 -0800 (PST)
Date: Fri, 21 Feb 2020 09:38:35 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org
Subject: Re: [PATCH] maint: Include top-level *.rst files early in git diff
Message-ID: <20200221083835.qielytbcsymbolrw@steredhat>
References: <20200220162214.3474280-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200220162214.3474280-1-eblake@redhat.com>
X-MC-Unique: 29GO6mSYPfWmXQaNmcILxg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 21 Feb 2020 08:38:45 -0000

On Thu, Feb 20, 2020 at 10:22:13AM -0600, Eric Blake wrote:
> We are converting more doc files to *.rst rather than *.texi.  Most
> doc files are already listed early in diffs due to our catchall
> docs/*, but a few top-level files get missed by that glob.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>=20
> Both *.texi and *.rst entries make sense while we are still converting
> things, but we'll need a followup to drop *.texi when the conversion
> is complete...
>=20
>  scripts/git.orderfile | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index 1f747b583a9e..abd8a67a2b4e 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -11,6 +11,7 @@
>=20
>  # Documentation
>  docs/*
> +*.rst
>  *.texi
>=20
>  # build system

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


