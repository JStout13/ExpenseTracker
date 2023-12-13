//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Jason Stout on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("firstView") private var firstView: Bool = true
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    @State private var activeTab: Tab = .recents
    
    var body: some View {
        LockView(lockType: .biometric, lockPin: "", isEnabled: isAppLockEnabled, lockWhenAppGoesBackground: lockWhenAppGoesBackground) {
            TabView(selection: $activeTab) {
                RecentsView()
                    .tag(Tab.recents)
                    .tabItem { Tab.recents.tabContent }
                
                SearchView()
                    .tag(Tab.search)
                    .tabItem { Tab.search.tabContent }
                
                GraphsView()
                    .tag(Tab.charts)
                    .tabItem { Tab.charts.tabContent }
                
                SettingsView()
                    .tag(Tab.settings)
                    .tabItem { Tab.settings.tabContent }
            }
            .tint(appTint)
            .sheet(isPresented: $firstView) {
                IntroView()
                    .interactiveDismissDisabled()
            }
        }
    }
}

#Preview {
    ContentView()
}
