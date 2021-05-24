Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llEpF-0002lp-3A
	for mharc-qemu-trivial@gnu.org; Mon, 24 May 2021 13:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1llEpD-0002g9-EG
 for qemu-trivial@nongnu.org; Mon, 24 May 2021 13:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1llEpB-0006wi-KP
 for qemu-trivial@nongnu.org; Mon, 24 May 2021 13:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621879029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmF6lhR9PeNjL1T/ol5eDiiMu0J1DgBAp5Io0f2uUTk=;
 b=cRPx0l9TyEFuviWFaP+goBDtpMkRDVZ/7Qy8tnxO3NKJ6ySQ20TuD+iksgEs1mLNjoL/YX
 7zSbGH7t2AvbZWikfd3PRTdD0I3h+av4Ovh5vqH1y4KebXtfoWk3Le+Imgz4QwSral64rV
 dSexi+hpUuv4Im0QpujV/N57gBj/7B4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-zfs7rSRzOUyXtyl3potT3g-1; Mon, 24 May 2021 13:57:07 -0400
X-MC-Unique: zfs7rSRzOUyXtyl3potT3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 349E9187656C;
 Mon, 24 May 2021 17:57:06 +0000 (UTC)
Received: from localhost (unknown [10.40.208.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A19356A8EF;
 Mon, 24 May 2021 17:57:00 +0000 (UTC)
Date: Mon, 24 May 2021 19:56:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/mem/pc-dimm: Hint it is not usable on non-NUMA machines
Message-ID: <20210524195658.033b19e6@redhat.com>
In-Reply-To: <20210524171352.3796151-1-f4bug@amsat.org>
References: <20210524171352.3796151-1-f4bug@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 24 May 2021 17:57:11 -0000

On Mon, 24 May 2021 19:13:52 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> When trying to use the pc-dimm device on a non-NUMA machine, we get:
>=20
>   $ qemu-system-arm -M none -cpu max -S -device pc-dimm
>   Segmentation fault (core dumped)
>=20
>   (gdb) bt
>   #0  pc_dimm_realize (dev=3D0x555556da3e90, errp=3D0x7fffffffcd10) at hw=
/mem/pc-dimm.c:184
>   #1  0x0000555555fe1f8f in device_set_realized (obj=3D0x555556da3e90, va=
lue=3Dtrue, errp=3D0x7fffffffce18) at hw/core/qdev.c:761
>   #2  0x0000555555feb4a9 in property_set_bool (obj=3D0x555556da3e90, v=3D=
0x555556e54420, name=3D0x5555563c3c41 "realized", opaque=3D0x555556a704f0, =
errp=3D0x7fffffffce18) at qom/object.c:2257
>=20
> Use a friendler error message instead:
>=20
>   $ qemu-system-arm -M none -cpu max -S -device pc-dimm
>   qemu-system-arm: -device pc-dimm: NUMA is not supported by this machine=
-type

it's not that pc-dimm inherently depends on numa, so maybe something like t=
his would be better:

@@ -183,12 +182,17 @@ static void pc_dimm_realize(DeviceState *dev, Error *=
*errp)
...
+    if (ms->numa_state) {
+        int nb_numa_nodes =3D ms->numa_state->num_nodes;
+
+        if ((nb_numa_nodes > 0) &&
+            (dimm->node >=3D nb_numa_nodes)) ||
+           (!nb_numa_nodes && dimm->node)) {
+               error_setg(errp, "'DIMM property " PC_DIMM_NODE_PROP " has =
value %"
+                          PRIu32 "' which exceeds the number of numa nodes=
: %d",
+                          dimm->node, nb_numa_nodes ? nb_numa_nodes : 1);
+            return;
+        }
+     } else if (dimm->node > 0)
+         error_setg(errp, "machine doesn't support numa");
=20

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mem/pc-dimm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index a3a2560301c..e8851a0c3b1 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -181,8 +181,13 @@ static void pc_dimm_realize(DeviceState *dev, Error =
**errp)
>      PCDIMMDevice *dimm =3D PC_DIMM(dev);
>      PCDIMMDeviceClass *ddc =3D PC_DIMM_GET_CLASS(dimm);
>      MachineState *ms =3D MACHINE(qdev_get_machine());
> -    int nb_numa_nodes =3D ms->numa_state->num_nodes;
> +    int nb_numa_nodes;
> =20
> +    if (!ms->numa_state) {
> +        error_setg(errp, "NUMA is not supported by this machine-type");
> +        return;
> +    }
> +    nb_numa_nodes =3D ms->numa_state->num_nodes;
>      if (!dimm->hostmem) {
>          error_setg(errp, "'" PC_DIMM_MEMDEV_PROP "' property is not set"=
);
>          return;


