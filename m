Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VRe2l-0000Xj-K7
	for mharc-qemu-trivial@gnu.org; Thu, 03 Oct 2013 04:13:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VRe2e-0000Vl-0C
	for qemu-trivial@nongnu.org; Thu, 03 Oct 2013 04:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VRe2X-0006WB-WE
	for qemu-trivial@nongnu.org; Thu, 03 Oct 2013 04:13:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1VRe2X-0006W4-Ob; Thu, 03 Oct 2013 04:13:41 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r938DeLI012733
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 3 Oct 2013 04:13:41 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-45.ams2.redhat.com
	[10.36.112.45])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r938Da2N020849; Thu, 3 Oct 2013 04:13:37 -0400
Message-ID: <524D2745.8060906@redhat.com>
Date: Thu, 03 Oct 2013 10:13:57 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>	<52488A00.6000405@msgid.tls.msk.ru>
	<52488E98.3060505@weilnetz.de>
	<871u46iq96.fsf@blackfin.pond.sub.org>
	<5249E4CD.1050605@weilnetz.de> <524C6DD0.9070605@msgid.tls.msk.ru>
	<524C80ED.3020507@weilnetz.de>
In-Reply-To: <524C80ED.3020507@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Fix compiler
 warning ('caps' may be used uninitialized)
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
X-List-Received-Date: Thu, 03 Oct 2013 08:13:54 -0000

Il 02/10/2013 22:24, Stefan Weil ha scritto:
> Am 02.10.2013 21:02, schrieb Michael Tokarev:
> MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
> {
>     MigrationCapabilityStatusList *head = NULL;
>     MigrationCapabilityStatusList *prev = NULL;
>     MigrationState *s = migrate_get_current();
>     MigrationCapability i;
> 
>     for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
>         MigrationCapabilityStatusList *caps =
>             g_new(MigrationCapabilityStatusList, 1);
>         if (prev == NULL) {
>             head = caps;
>         } else {
>             prev->next = caps;
>             prev = caps;
>         }
>         caps->value = g_new(MigrationCapabilityStatus, 1);
>         caps->value->capability = i;
>         caps->value->state = s->enabled_capabilities[i];
>     }
> 
>     return head;
> }

I dislike having head initialized to NULL.

> Which one do we take? Any correct solution which fixes the compiler
> warning is fine for me (although I prefer g_new instead of g_malloc as
> you might have guessed). :-)

Mine uses g_new0 so it should work for you as well? :)

Paolo


