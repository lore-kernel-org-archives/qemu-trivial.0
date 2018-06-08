Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRKtY-0007Ai-VV
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 13:09:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fRKtW-00078L-8P
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 13:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fRKtV-0008MJ-0G
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 13:09:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58906 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fRKtP-0008Fy-56; Fri, 08 Jun 2018 13:09:39 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8BAC40122A8;
	Fri,  8 Jun 2018 17:09:37 +0000 (UTC)
Received: from t460.redhat.com (unknown [10.33.36.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96BAE2166BB2;
	Fri,  8 Jun 2018 17:09:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Fri,  8 Jun 2018 18:09:25 +0100
Message-Id: <20180608170933.9137-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 08 Jun 2018 17:09:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 08 Jun 2018 17:09:37 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 0/8] Add a standard authorization framework
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
X-List-Received-Date: Fri, 08 Jun 2018 17:09:47 -0000

The current network services now support encryption via TLS and in some
cases support authentication via SASL. In cases where SASL is not
available, x509 client certificates can be used as a crude authorization
scheme, but using a sub-CA and controlling who you give certs to. In
general this is not very flexible though, so this series introduces a
new standard authorization framework.

It comes with four initial authorization mechanisms

 - Simple - an exact username match. This is useful when there is
   exactly one user that is known to connect. For example when live
   migrating from one QEMU to another with TLS, libvirt would use
   the simple scheme to whitelist the TLS cert of the source QEMU.

 - List - an full access control list, with optional regex matching.
   This is more flexible and is used to provide 100% backcompat with
   the existing HMP ACL commands. The caveat is that we can't create
   these via the CLI -object arg yet.

 - ListFile - the same as List, but with the rules stored in JSON
   format in an external file. This avoids the -object limitation
   while also allowing the admin to change list entries on the file.
   QEMU uses inotify to notice these changes and auto-reload the
   file contents. This is likely a good default choice for most
   network services, if the "simple" mechanism isn't sufficient.

 - PAM - delegate the username lookup to a PAM module, which opens
   the door to many options including things like SQL/LDAP lookups.

A later series that follows will integrate this framework into the VNC,
NBD, migration, and character device servers.

Daniel P. Berrang=C3=A9 (8):
  util: add helper APIs for dealing with inotify
  hw/usb: switch MTP to use new inotify APIs
  authz: add QAuthZ object as an authorization base class
  authz: add QAuthZSimple object type for trivial auth checks
  authz: add QAuthZList object type for an access control list
  authz: add QAuthZListFile object type for a file access control list
  authz: add QAuthZPAM object type for authorizing using PAM
  authz: delete existing ACL implementation

 .gitignore                     |   4 +
 MAINTAINERS                    |  14 ++
 Makefile                       |  17 +-
 Makefile.objs                  |  10 ++
 Makefile.target                |   2 +
 authz/Makefile.objs            |   7 +
 authz/base.c                   |  82 +++++++++
 authz/list.c                   | 315 +++++++++++++++++++++++++++++++++
 authz/listfile.c               | 252 ++++++++++++++++++++++++++
 authz/pam.c                    | 149 ++++++++++++++++
 authz/simple.c                 | 122 +++++++++++++
 authz/trace-events             |  18 ++
 configure                      |  36 ++++
 crypto/tlssession.c            |  35 ++--
 crypto/trace-events            |   2 +-
 hw/usb/dev-mtp.c               | 238 ++++++++++---------------
 include/authz/base.h           | 112 ++++++++++++
 include/authz/list.h           | 106 +++++++++++
 include/authz/listfile.h       | 104 +++++++++++
 include/authz/pam.h            |  84 +++++++++
 include/authz/simple.h         |  81 +++++++++
 include/qemu/acl.h             |  66 -------
 include/qemu/inotify.h         |  49 +++++
 monitor.c                      | 180 ++++++++++++-------
 qapi/authz.json                |  58 ++++++
 qapi/qapi-schema.json          |   1 +
 qom/object.c                   |  12 +-
 qom/object_interfaces.c        |  16 +-
 tests/.gitignore               |   1 +
 tests/Makefile.include         |   8 +-
 tests/test-authz-list.c        | 171 ++++++++++++++++++
 tests/test-crypto-tlssession.c |  15 +-
 tests/test-io-channel-tls.c    |  16 +-
 ui/vnc-auth-sasl.c             |  23 ++-
 ui/vnc-auth-sasl.h             |   5 +-
 ui/vnc-auth-vencrypt.c         |   2 +-
 ui/vnc-ws.c                    |   2 +-
 ui/vnc.c                       |  37 ++--
 ui/vnc.h                       |   4 +-
 util/Makefile.objs             |   2 +-
 util/acl.c                     | 179 -------------------
 util/inotify.c                 | 138 +++++++++++++++
 42 files changed, 2258 insertions(+), 517 deletions(-)
 create mode 100644 authz/Makefile.objs
 create mode 100644 authz/base.c
 create mode 100644 authz/list.c
 create mode 100644 authz/listfile.c
 create mode 100644 authz/pam.c
 create mode 100644 authz/simple.c
 create mode 100644 authz/trace-events
 create mode 100644 include/authz/base.h
 create mode 100644 include/authz/list.h
 create mode 100644 include/authz/listfile.h
 create mode 100644 include/authz/pam.h
 create mode 100644 include/authz/simple.h
 delete mode 100644 include/qemu/acl.h
 create mode 100644 include/qemu/inotify.h
 create mode 100644 qapi/authz.json
 create mode 100644 tests/test-authz-list.c
 delete mode 100644 util/acl.c
 create mode 100644 util/inotify.c

--=20
2.17.0


