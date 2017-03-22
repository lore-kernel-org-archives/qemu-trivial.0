Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqiUE-0004CI-2D
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 11:47:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vfeenstr@redhat.com>) id 1cqiUC-0004BK-CR
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 11:47:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vfeenstr@redhat.com>) id 1cqiU9-0001kt-QX
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 11:47:44 -0400
Received: from mail-wr0-f177.google.com ([209.85.128.177]:33020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vfeenstr@redhat.com>) id 1cqiU9-0001kC-Kv
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 11:47:41 -0400
Received: by mail-wr0-f177.google.com with SMTP id y90so14195775wrb.0
	for <qemu-trivial@nongnu.org>; Wed, 22 Mar 2017 08:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=v7rGarija0bnoM4Xqf4vXe/RhSRinjceQy9nP0JddNU=;
	b=eLJRmpl9BHlmVo+bGCgRx9SxRCrwazvlSMCA2SX6zYWobr8+XP4VVf2Sk89jgj43iY
	+FDMJNHe0yhOqpEC3qxXqVcJW7w0w2utwapURAaUgBSPhXWBAUtY/+BE0HHuPmULZSzl
	4lPWWBe/5reTirb3MNQ/v8Sjms7V5d+1MT52HRFHGarcL3mRI904ibfxp/tQ2hMvJUO+
	zusqH8UVUnpyl2v9oh1UL+ll0aLUBnPyt//eFSqL7yEwMNPl1uxbEKpdFOuvyafzAdrx
	ormFivcDZ54BBHGNIiOG3gTjZvxHauj4KoAadYsiYgzlX/MwAscNPqGsnn3OEWnwQHvw
	kL5A==
X-Gm-Message-State: AFeK/H2kpKvPPkSY3syr/9/uC2xGkb5u+AOv6xGb+4cBOLFEbf8H0EbCENPILPfyNA8P0dmX
X-Received: by 10.223.136.182 with SMTP id f51mr33890144wrf.90.1490197660392; 
	Wed, 22 Mar 2017 08:47:40 -0700 (PDT)
Received: from dhcp131-51.brq.redhat.com (nat-pool-brq-t.redhat.com.
	[213.175.37.10])
	by smtp.gmail.com with ESMTPSA id s18sm812368wmb.18.2017.03.22.08.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 08:47:39 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
From: Vinzenz Feenstra <vfeenstr@redhat.com>
In-Reply-To: <20170322154649.6947-1-vfeenstr@redhat.com>
Date: Wed, 22 Mar 2017 16:47:39 +0100
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <50AD4E3B-F0A3-48AC-B2EB-770D80678981@redhat.com>
References: <20170322154649.6947-1-vfeenstr@redhat.com>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3259)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.177
Subject: Re: [Qemu-trivial] [PATCH] qga: Add `guest-get-timezone` command
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
X-List-Received-Date: Wed, 22 Mar 2017 15:47:45 -0000

Sorry I meant to add you Michael not Paolo -_-

> On Mar 22, 2017, at 4:46 PM, Vinzenz 'evilissimo' Feenstra =
<vfeenstr@redhat.com> wrote:
>=20
> From: Vinzenz Feenstra <vfeenstr@redhat.com>
>=20
> Adds a new command `guest-get-timezone` reporting the currently
> configured timezone on the system. The information on what timezone is
> currently is configured is useful in case of Windows VMs where the
> offset of the hardware clock is required to have the same offset. This
> can be used for management systems like `oVirt` to detect the timezone
> difference and warn administrators of the misconfiguration.
>=20
> Signed-off-by: Vinzenz Feenstra <vfeenstr@redhat.com>
> ---
> qga/commands.c       | 19 +++++++++++++++++++
> qga/qapi-schema.json | 25 +++++++++++++++++++++++++
> 2 files changed, 44 insertions(+)
>=20
> diff --git a/qga/commands.c b/qga/commands.c
> index 4d92946..83d7f99 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
> @@ -499,3 +499,22 @@ int ga_parse_whence(GuestFileWhence *whence, =
Error **errp)
>     error_setg(errp, "invalid whence code %"PRId64, whence->u.value);
>     return -1;
> }
> +
> +GuestTimezone *qmp_guest_get_timezone(Error **errp)
> +{
> +    GuestTimezone *info =3D g_new0(GuestTimezone, 1);
> +    GTimeZone *tz =3D g_time_zone_new_local();
> +    gint32 interval =3D g_time_zone_find_interval(tz, =
G_TIME_TYPE_STANDARD, 0);
> +    gchar const *name =3D g_time_zone_get_abbreviation(tz, interval);
> +    if (name !=3D NULL) {
> +        info->offset =3D g_time_zone_get_offset(tz, interval) / 60;
> +        info->zone =3D g_strdup(name);
> +    } else {
> +        error_setg(errp, "Timezone lookup failed");
> +        g_free(info);
> +        info =3D NULL;
> +    }
> +    g_time_zone_unref(tz);
> +    return info;
> +}
> +
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index a02dbf2..6683aae 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1042,3 +1042,28 @@
>   'data':    { 'path': 'str', '*arg': ['str'], '*env': ['str'],
>                '*input-data': 'str', '*capture-output': 'bool' },
>   'returns': 'GuestExec' }
> +
> +
> +##
> +# @GuestTimezone:
> +#
> +# @zone:    Timezone name
> +# @offset:  Offset to UTC in minutes
> +#
> +# Since: 2.10
> +##
> +{ 'struct': 'GuestTimezone',
> +  'data':   { 'zone': 'str', 'offset': 'int' } }
> +
> +
> +##
> +# @guest-get-timezone:
> +#
> +# Retrieves the timezone information from the guest.
> +#
> +# Returns: The guest timezone GuestTimezone information on success.
> +#
> +# Since: 2.10
> +##
> +{ 'command': 'guest-get-timezone',
> +  'returns': 'GuestTimezone' }
> --=20
> 2.9.3
>=20


