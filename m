Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izgcO-0000ji-6M
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 07:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgcL-0000j6-QJ
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:50:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcK-0005Iw-KH
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:50:49 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:48687)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcK-0005CF-BG; Thu, 06 Feb 2020 07:50:48 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MLAAs-1jHtzG1Rek-00IDyH; Thu, 06 Feb 2020 13:50:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 00/12] Trivial branch patches
Date: Thu,  6 Feb 2020 13:50:15 +0100
Message-Id: <20200206125027.1926263-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QzrtNTtr1K/Hl64rveH+CH3JhhqW2lAEJSTsE1MD4Gf/mDf2eDG
 hcp6UwtyYGq2ZDKfQLywQR/Cbj4isrd1eOE0vfg2DmT9RgwJ+Mf/fzwBHYOZsk3WOXe7CoG
 XVD9F+1JVH68RHSSP1QFWUKI3lggejSWLdxNVWGhfC3VovWD883sn7qhA0yhnGck+JWmQVF
 fK4hc9oJiKuwv9ddsA8EQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uGANA53uBh8=:mJANNCyFK9Ag03MxmagNJE
 j44usZCp4LHSJeTclAX7LZg4UuEKy5aJBMJhQKwNDlvJDWyGW6BRUc7M9z6mrTHZy6FJVYeTp
 024lseQ2xq6hhO4kjUxY92mAHsDrsICKb+YPpiR3tSQe7EBujZmotQLZwtpCXmD4kmGbWJ8q9
 iEk8yGU9hzlOB8iZzIMipyHqBbg/s3/QZ+egOUQPJk9tQxag1rtUo0YGU/VEm6UqmpSzIEzv+
 SuqyH5r1zIcWjTSln6NwJOvhwFc5TABCKThzIuHHS+9ShSGXk6gFYPtSy3D1H93pKu3AWZ3sv
 j4LeEu24Hf9Kn4xs2lDOuycr3d/sP5gF3Y5VmY053wH8JR2zVDH5vk4Qt7wE8LGY1KI7k1VU9
 aOLJRbF0iQ7Q+WCH+TmYq6vQmX9rjjpjxcXHht7eEhFMkNqL5DOwXvr+5cgE3OuB5aF6/uZWU
 SeF6Of9ebNYR5HrU3GJbGb+tMYI80laJIqNf8Jc46w7BoCZ8KaCdrNGmU7Z3GHK/yYHIHdcau
 Ktw3FUbxfLhu2sOuSBHrWQ0nUFWJCQ8YOa5ADEIfaI+FDEOUtQRMgRzNM10gY/6UjFOWfSWG/
 TitqJo8xo8hzoTmghFptOGuFD+qygIfjaFXSigzynQ/0D+mKBsxw5xhHw0zmRKHCdhm/l81L5
 tTm+basNwLzPQAMwD9MDESZ/u00mbP3u9PUzJCEtYe59NBHjNO60mSg3NTHfAdhTTE32CY4qb
 usX+c1+jHcFaXuOPTVL+qY8yVQ/wAkRJqo+bNxT/rOhvCAUDRyXmwfzTc/nj8iviSNIrO9U77
 GYNL/onpkqa+DCYPFN6Ce3h8YHnsKLEvSVxNubbY9yN3ea+USLErU2nKXs56NGXLFOofpiH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
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
X-List-Received-Date: Thu, 06 Feb 2020 12:50:51 -0000

The following changes since commit 7bd9d0a9e26c7a3c67c0f174f0009ba19969b158:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-02-04' into staging (2020-02-04 16:12:31 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 8ef350b32fe08d254f92a3a7efe89809397fff77:

  MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM machines (2020-02-06 12:32:03 +0100)

----------------------------------------------------------------
trivial patches 20200206

----------------------------------------------------------------

Chen Qun (1):
  monitor: fix memory leak in monitor_fdset_dup_fd_find_remove

John Snow (1):
  qemu-options: replace constant 1 with HAS_ARG

Julia Suvorova (2):
  qemu-img: Place the '-i aio' option in alphabetical order
  hw/pci/pci_bridge: Fix typo in comment

Leif Lindholm (1):
  MAINTAINERS: update Leif Lindholm's address

Miroslav Rezanina (1):
  aspeed/i2c: Prevent uninitialized warning

Philippe Mathieu-Daudé (4):
  hw/smbios/smbios: Remove unused include
  hw/timer/m48t59: Convert debug printf()s to trace events
  MAINTAINERS: Cover hppa-softmmu.mak in the HP-PARISC Machines section
  MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM machines

Thomas Huth (2):
  hw/bt: Remove empty Kconfig file
  hw/i386/vmmouse: Fix crash when using the vmmouse on a machine without
    vmport

 .mailmap                    |  1 +
 MAINTAINERS                 | 10 +++++++++-
 docs/interop/qemu-img.rst   |  8 ++++----
 hw/bt/Kconfig               |  0
 hw/i2c/aspeed_i2c.c         |  2 +-
 hw/i386/vmmouse.c           |  6 ++++++
 hw/rtc/m48t59-internal.h    |  5 -----
 hw/rtc/m48t59.c             | 11 +++++------
 hw/rtc/trace-events         |  6 ++++++
 hw/smbios/smbios.c          |  1 -
 include/hw/pci/pci_bridge.h |  2 +-
 monitor/misc.c              |  1 +
 qemu-img-cmds.hx            |  4 ++--
 qemu-options.hx             |  2 +-
 14 files changed, 37 insertions(+), 22 deletions(-)
 delete mode 100644 hw/bt/Kconfig

-- 
2.24.1


