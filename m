Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jy93e-0008Sz-2b
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jul 2020 03:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jy93b-0008SY-RI
 for qemu-trivial@nongnu.org; Wed, 22 Jul 2020 03:20:51 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23057
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jy93Z-000647-BC
 for qemu-trivial@nongnu.org; Wed, 22 Jul 2020 03:20:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595402447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/tZNnYDJt9bCst9DPYohgEP7XNzpWqVDFP3A2Rf8Ck=;
 b=QYycQXqlY+3+k98jtnfkgKSBG3kdqP9owgeVDxK4CXskhXZ4MdKTJGj/cy73+os7l92/5T
 mbESOjEeMkEvPCeXZGGVN+Co5s1QYFiph32DnpBM/A5rfCvtpB7ryFbQ9cQurj1RO2QmEo
 07YK2Uo6hvEYZCZ+LRShneyGCOYq+rM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-3yY9t-_nPkWet_Aim13jkg-1; Wed, 22 Jul 2020 03:20:45 -0400
X-MC-Unique: 3yY9t-_nPkWet_Aim13jkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B02801DE2;
 Wed, 22 Jul 2020 07:20:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 654A572680;
 Wed, 22 Jul 2020 07:20:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F3B5A10F5AF1; Wed, 22 Jul 2020 09:20:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <ehabkost@redhat.com>,
 qemu-trivial@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qdev: Document qdev_prop_set_drive_err() return value
References: <20200720121659.31886-1-f4bug@amsat.org>
Date: Wed, 22 Jul 2020 09:20:42 +0200
In-Reply-To: <20200720121659.31886-1-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 20 Jul 2020 14:16:59
 +0200")
Message-ID: <87lfjcyq0l.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 21:28:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 07:20:52 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Since commit 73ac1aac39 qdev_prop_set_drive_err() returns
> a boolean value. Document it.
>
> Fixes: 73ac1aac39 "Make functions taking Error ** return bool, not void"
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/qdev-properties.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 587e5b7d31..3a64d5ab9a 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -238,6 +238,8 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
> =20
>  /*
>   * Set properties between creation and realization.
> + *
> + * Returns: %true on success, %false on error.
>   */
>  bool qdev_prop_set_drive_err(DeviceState *dev, const char *name,
>                               BlockBackend *value, Error **errp);

Reviewed-by: Markus Armbruster <armbru@redhat.com>


