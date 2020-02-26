Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j74SY-0003Sl-Ig
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2020 16:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j74SV-0003SH-TG
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 16:43:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j74SU-0001WE-0a
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 16:43:11 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39367
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j74ST-0001SP-Jv
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 16:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582753388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d8UFU7LACjbl7GOakU0eK1xtN0+bkdSm5FZppkMQJcA=;
 b=MJHEDmDVgVszHBtEmmteZiT03D0AC3UBf8rMPr751qSXZcWXoOedHAVQT6d0YWxaKCCuEy
 Zl48GUTSqEXAfpXMqHTZ+0od3qP1P1UoNqY0q7r83inhYjcDGpJrkQc3L2QbRce2Fk0qa3
 kpLfSWx8VJ7d8OVpIcH7uBgzcRJJ4xU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-veZ2tfu_NASNH9NKm8MNfw-1; Wed, 26 Feb 2020 16:43:07 -0500
X-MC-Unique: veZ2tfu_NASNH9NKm8MNfw-1
Received: by mail-qk1-f198.google.com with SMTP id v189so386191qkb.16
 for <qemu-trivial@nongnu.org>; Wed, 26 Feb 2020 13:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FTPRBXY2Ub1X/FK6561PHf1BKgQVQN/ZdThkc+uN2Ec=;
 b=OcOOEQ5Wrfh+JuknNUvqI450NAPPh9q2V0TSRgrmaUnTFCI6rZlnwxKPyXmvabLV4e
 AA4XrSTNseBXPmdWkVmA1MovSsGT9wUF7e8TFXdxe6tNpV4lX8AuL75rxcWfKe/WFRUo
 AeOQ9YA18d6WwaRfhxTpurYTFLTEci9hvjWKB2OSQM9Xci3ZeW0MJcMfADazNwqREThb
 qvLejpaHnHPvXEVGromuQOq0tpSOTas59mbFZfZczznhWmKQa5b06Qd4Cx0/QpDxKhUF
 T0tQAy9cquRdvGc3VU5ZKRBPw9AS3uKb39NN+Sfw8IVeDexm+W61teI/7a7t2JfEXyXj
 ozTA==
X-Gm-Message-State: APjAAAUF4mcyjMU1MTUSwQhsUVho3b7hVFjdFDt6dqt+tuP6qcSUjvcK
 kFpul5729EVZ4mOBX1Gtkm4ygMdBThsnN2++FuqvL0aFnLvzSlHxpVYGV28VLoW/BK2b1512Ajo
 GhniRwbGpRgTtWi3CXA==
X-Received: by 2002:a05:6214:a48:: with SMTP id
 ee8mr1340943qvb.90.1582753386527; 
 Wed, 26 Feb 2020 13:43:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXoYRp8cm5ORMAV4UDyxKHuAm4M6pgK2T42Gzs6Wq2yVGDgkWh8H3Es/y3o0kkjYFkfS67bw==
X-Received: by 2002:a05:6214:a48:: with SMTP id
 ee8mr1340921qvb.90.1582753386334; 
 Wed, 26 Feb 2020 13:43:06 -0800 (PST)
Received: from xz-x1 (CPEf81d0fb19163-CMf81d0fb19160.cpe.net.fido.ca.
 [72.137.123.47])
 by smtp.gmail.com with ESMTPSA id v10sm1847664qtj.26.2020.02.26.13.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 13:43:05 -0800 (PST)
Date: Wed, 26 Feb 2020 16:43:04 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, Yi Sun <yi.y.sun@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Liu Yi L <yi.l.liu@intel.com>
Subject: Re: [PATCH v2] hw/i386/intel_iommu: Simplify
 vtd_find_as_from_bus_num() logic
Message-ID: <20200226214304.GC180973@xz-x1>
References: <20200226201030.22583-1-philmd@redhat.com>
 <20200226202054.GA180973@xz-x1>
MIME-Version: 1.0
In-Reply-To: <20200226202054.GA180973@xz-x1>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 26 Feb 2020 21:43:12 -0000

On Wed, Feb 26, 2020 at 03:20:54PM -0500, Peter Xu wrote:

[...]

> (However we'll need to read below after all... :)
>=20
> Reviewed-by: Peter Xu <peterx@redhat.com>

As pointed out by Eric: it seems this patch cannot apply too...  I
think it's the extra "git diff -w" output that confused git-am.

Phil, would you mind repost without those?  My r-b stands if the
content keeps the same.

Thanks,

--=20
Peter Xu


